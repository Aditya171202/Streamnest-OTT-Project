from django.shortcuts import render,redirect
from django.contrib.auth import login,logout,authenticate,get_user_model
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from.forms import CustomUserCreationForm
from django.contrib.auth.decorators import login_required
from django.views.decorators.cache import never_cache
from django.contrib import messages
from .forms import CustomUserCreationForm
import stripe
from.models import Profile
from django.conf import settings
from django.utils.timezone import now, timedelta
from movies.models import ComingSoon,Genre,Movie
from series.models import Genre,Series


stripe.api_key = settings.STRIPE_SECRET_KEY


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
        if form.is_valid():
            user = form.save(commit=False)
            user.is_active = False  
            user.save()
            request.session['new_user_id'] = user.id
            try:
                checkout_session = stripe.checkout.Session.create(
                    payment_method_types=['card'],
                    line_items=[{
                        'price_data': {
                            'currency': 'inr',
                            'product_data': {'name': 'StreamNest Subscription'},
                            'unit_amount': 49900, 
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
            messages.error(request, "Please correct the errors below.")
    else:
        form = CustomUserCreationForm()

    return render(request, "register.html", {"form": form})


@never_cache   
def user_login(request):
    if request.method=="POST":
        username=request.POST.get("username")
        password=request.POST.get("password")
        user=authenticate(username=username,password=password)
        if user is not None:
            login(request,user)
            return redirect('home')
        else:
            messages.error(request,"Login failed")
            return render(request,"login.html")
    else:
        return render(request, "login.html")
    
@never_cache
def user_logout(request):
    logout(request)
    return redirect("login")

stripe.api_key = settings.STRIPE_SECRET_KEY

def create_checkout_session(request):
    try:
        checkout_session = stripe.checkout.Session.create(
            payment_method_types=['card'],
            line_items=[{
                'price_data': {
                    'currency': 'inr',
                    'product_data': {
                        'name': 'StreamNest Subscription',
                    },
                    'unit_amount': 49900, 
                },
                'quantity': 1,
            }],
            mode='payment',
            success_url=request.build_absolute_uri('/payment-success/'),
            cancel_url=request.build_absolute_uri('/payment-failed/'),
        )
        return redirect(checkout_session.url)
    except Exception as e:
        return render(request, "payment_error.html", {"error": str(e)})

User = get_user_model()

def payment_success(request):
    user_id = request.session.get('new_user_id')
    if user_id:
        user = User.objects.get(id=user_id)
        user.is_active = True
        user.profile.subscription_end = now() + timedelta(days=365)
        user.profile.save()
        user.save()
        login(request, user)
        request.session.pop('new_user_id', None)
    else:
        messages.warning(request, "Your session expired. Please login again.")
        return redirect('login')

    return render(request, "payment_success.html")

def payment_failed(request):
    return render(request, "payment_failed.html")