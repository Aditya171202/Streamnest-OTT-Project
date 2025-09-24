from django.shortcuts import render
from.models import Movie

def movie_list(request):
    try:
        movies = Movie.objects.all()
    except Exception as e:
        movies = []
        print("Error loading movies:", e)

    subscription_end = None
    if request.user.is_authenticated and hasattr(request.user, 'profile'):
        subscription_end = request.user.profile.subscription_end

    context = {
        "movies": movies,
        "subscription_end": subscription_end,  
    }
    return render(request, "movie_list.html", context)


