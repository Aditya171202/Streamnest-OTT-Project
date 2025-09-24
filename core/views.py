from django.shortcuts import render
from movies.models import Movie
from series.models import Series
from django.db.models import Q
from .models import Genre

def search(request):
    query = request.GET.get('q', '')
    
    movie_results = Movie.objects.filter(title__icontains=query)
    series_results = Series.objects.filter(title__icontains=query)
    
    results = []

    for movie in movie_results:
        movie.get_type = lambda: 'movie' 
        results.append(movie)

    for series in series_results:
        series.get_type = lambda: 'series'
        series.episode_list = series.episodes.all()  
        results.append(series)

    context = {
        'query': query,
        'results': results,
    }
    return render(request, 'search_results.html', context)

def genre_results(request, genre_id):
    try:
        genre = Genre.objects.get(id=genre_id)
        movies = Movie.objects.filter(genres=genre)
        series = Series.objects.filter(genres=genre)
        results = list(movies) + list(series)
    except Genre.DoesNotExist:
        genre = None
        results = []

    context = {
        'genre': genre,
        'results': results
    }
    return render(request, 'genre_results.html', context)

