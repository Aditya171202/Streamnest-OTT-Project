from django.shortcuts import render, redirect
from django.contrib.auth import login, logout, authenticate, get_user_model
from django.contrib.auth.decorators import login_required
from django.views.decorators.cache import never_cache
from django.contrib import messages
from .forms import CustomUserCreationForm
import stripe
from .models import Profile
from django.conf import settings
from django.utils.timezone import now, timedelta
from movies.models import ComingSoon, Genre, Movie
from series.models import Genre as SeriesGenre, Series

stripe.api_key = settings.STRIPE_SECRET_KEY
User = get_user_model()


@never_cache
@login_required
def home(request):
    genre_id = request.GET.get('genre')
    genres = Genre.objects.all()

    if genre_id:
        movies = Movie.objects.filter(genres__id=genre_id)
        series = Series.objects.filter(genres__id=genre_id)
        selected_genre = int(genre_id)
    else:
        movies = Movie.objects.all()
        series = Series.objects.all()
        selected_genre = None

    coming_soon = ComingSoon.objects.order_by('release_date')

    subscription_end = None
    if hasattr(request.user, "profile"):
        subscription_end = request.user.profile.subscription_end

    context = {
        'genres': genres,
        'selected_genre': selected_genre,
        'movies': movies,
        'series': series,
        'coming_soon': coming_soon,
        'subscription_end': subscription_end, 
    }
    return render(request, 'index.html', context)

@never_cache
def register(request):
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)
        plan = request.POST.get("plan")

        if not plan or plan not in ["month", "year"]:
            messages.error(request, "Please select a valid subscription plan.")
            return render(request, "register.html", {"form": form})

        if form.is_valid():
            user = form.save(commit=False)
            user.is_active = False
            user.save()
      
            request.session['new_user_id'] = user.id
            request.session['plan'] = plan
            request.session.save()

            amount = {"month": 19900, "year": 99900}[plan]

            try:
                checkout_session = stripe.checkout.Session.create(
                    payment_method_types=['card'],
                    line_items=[{
                        'price_data': {
                            'currency': 'inr',
                            'product_data': {'name': f'StreamNest {plan.capitalize()} Subscription'},
                            'unit_amount': amount,
                        },
                        'quantity': 1,
                    }],
                    mode='payment',
                    success_url=request.build_absolute_uri('/payment-success/'),
                    cancel_url=request.build_absolute_uri('/payment-failed/'),
                )
                return redirect(checkout_session.url)

            except Exception as e:
                messages.error(request, f"Payment initialization failed: {str(e)}")
                return render(request, "register.html", {"form": form})
        else:
            messages.error(request, "Please correct the errors in the form.")

    else:
        form = CustomUserCreationForm()

    return render(request, "register.html", {"form": form})



@never_cache
def user_login(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(username=username, password=password)
        
        if user is not None:
            login(request, user)


            if not hasattr(user, "profile"):
                from .models import Profile
                Profile.objects.create(user=user)


            if user.profile.subscription_end and user.profile.subscription_end > now():

                return redirect("home")
            else:
   
                messages.info(request, "Your subscription has expired. Please resubscribe.")

                request.session['new_user_id'] = user.id 
   
                request.session['plan'] = 'month'  
                request.session.save()

                try:
     
                    amount = 19900 
                    checkout_session = stripe.checkout.Session.create(
                        payment_method_types=['card'],
                        line_items=[{
                            'price_data': {
                                'currency': 'inr',
                                'product_data': {'name': 'StreamNest Monthly Subscription'},
                                'unit_amount': amount,
                            },
                            'quantity': 1,
                        }],
                        mode='payment',
                        success_url=request.build_absolute_uri('/payment-success/'),
                        cancel_url=request.build_absolute_uri('/payment-failed/'),
                    )
                    return redirect(checkout_session.url)

                except Exception as e:
                    messages.error(request, f"Payment initialization failed: {str(e)}")
                    return redirect("subscription_page")
        else:
            messages.error(request, "Login failed. Please check your credentials.")
            return render(request, "login.html")
    else:
        return render(request, "login.html")


@never_cache
def user_logout(request):
    logout(request)
    return redirect("login")


def payment_success(request):
    user_id = request.session.get('new_user_id')
    plan = request.session.get('plan', 'year')  # Default to year

    if user_id:
        try:
            user = User.objects.get(id=user_id)
            user.is_active = True
            user.save()

            # Ensure profile exists
            if not hasattr(user, "profile"):
                Profile.objects.create(user=user)

            # Update subscription
            if plan == "month":
                user.profile.subscription_end = now() + timedelta(days=30)
            else:  # year
                user.profile.subscription_end = now() + timedelta(days=365)

            user.profile.save()
            login(request, user)

            # Clear session
            request.session.pop('new_user_id', None)
            request.session.pop('plan', None)

            messages.success(request, f"Welcome {user.username}! Your subscription is active.")
            return render(request, "payment_success.html")

        except User.DoesNotExist:
            messages.error(request, "User not found. Please login.")
            return redirect("login")

    else:
        messages.warning(request, "Your session expired. Please login again.")
        return redirect("login")



def payment_failed(request):
    return render(request, "payment_failed.html")


@login_required
def subscription_page(request):
    return render(request, "subscription.html")


@login_required
def subscribe(request, plan):
    if plan not in ["month", "year"]:
        messages.error(request, "Invalid plan selected.")
        return redirect("subscription_page")

    amount = {"month": 19900, "year": 99900}[plan]

    try:
        checkout_session = stripe.checkout.Session.create(
            payment_method_types=['card'],
            line_items=[{
                'price_data': {
                    'currency': 'inr',
                    'product_data': {'name': f'StreamNest {plan.capitalize()} Subscription'},
                    'unit_amount': amount,
                },
                'quantity': 1,
            }],
            mode='payment',
            success_url=request.build_absolute_uri('/payment-success/'),
            cancel_url=request.build_absolute_uri('/payment-failed/'),
            client_reference_id=request.user.id
        )
        return redirect(checkout_session.url)
    except Exception as e:
        messages.error(request, f"Payment initialization failed: {str(e)}")
        return redirect("subscription_page")

