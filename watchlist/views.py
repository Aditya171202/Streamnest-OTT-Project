from django.shortcuts import render, redirect
from .models import WatchlistItem
from movies.models import Movie
from series.models import Series


def watchlist(request):
    items = WatchlistItem.objects.filter(user=request.user)

  
    subscription_end = None
    if request.user.is_authenticated and hasattr(request.user, 'profile'):
        subscription_end = request.user.profile.subscription_end

    context = {
        "items": items,
        "subscription_end": subscription_end, 
    }

    return render(request, "watchlist.html", context)



def add_to_watchlist(request, content_type, pk):
    if content_type == "movie":
        try:
            obj = Movie.objects.get(pk=pk)
            WatchlistItem.objects.get_or_create(user=request.user, movie=obj)
        except Movie.DoesNotExist:
            return redirect('/movies/')
            
    elif content_type == "series":
        try:
            obj = Series.objects.get(pk=pk)
            WatchlistItem.objects.get_or_create(user=request.user, series=obj)
        except Series.DoesNotExist:
            return redirect('/series/')

    return redirect(request.META.get("HTTP_REFERER", "/"))

def remove_from_watchlist(request, pk):
    try:
        item = WatchlistItem.objects.get(pk=pk, user=request.user)
        item.delete()
    except WatchlistItem.DoesNotExist:
        pass

    return redirect('watchlist')



