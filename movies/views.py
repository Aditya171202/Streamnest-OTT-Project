from django.shortcuts import render
from.models import Movie

def movie_list(request):
    movies=Movie.objects.all()
    context={
        "movies":movies
    }
    return render(request,'movie_list.html',context)

def movie_list(request):
    try:
        movies = Movie.objects.all()
    except Exception as e:
        movies = [] 
        print("Error loading movies:", e)

    context = {
        "movies": movies
        }
    return render(request, "movie_list.html", context)

