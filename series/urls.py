from django.urls import path
from . import views

urlpatterns = [
    path('series/', views.series_list, name='series_list'),
    path('series/<int:series_id>/', views.series_detail, name='series_detail'),
    path('series/<int:series_id>/episode/<int:episode_number>/', views.series_detail, name='series_episode'),
]
