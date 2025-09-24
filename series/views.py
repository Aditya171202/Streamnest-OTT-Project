from django.shortcuts import render
from.models import Series,Episode

def series_list(request):
    series = Series.objects.all()

    subscription_end = None
    if request.user.is_authenticated and hasattr(request.user, 'profile'):
        subscription_end = request.user.profile.subscription_end

    context = {
        "series": series,
        "subscription_end": subscription_end,  
    }
    return render(request, 'series_list.html', context)



def series_detail(request, series_id, episode_number=None):
    try:
        series = Series.objects.get(id=series_id)
        episodes = series.episodes.all().order_by("number")
    except Series.DoesNotExist:
        series = None
        episodes = []

    current_episode = None
    next_episode = None

    if series and episodes:
        try:
            if episode_number:
                current_episode = episodes.get(number=episode_number)
            else:
                current_episode = episodes.first()
        except Episode.DoesNotExist:
            current_episode = episodes.first()
        try:
            next_episode = episodes.get(number=current_episode.number + 1)
        except Episode.DoesNotExist:
            next_episode = None

    context = {
        "series": series,
        "episodes": episodes,
        "current_episode": current_episode,
        "next_episode": next_episode,
    }
    return render(request, "series_detail.html", context)


