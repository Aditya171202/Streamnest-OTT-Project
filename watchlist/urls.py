from django.urls import path
from . import views

urlpatterns = [
    path('', views.watchlist, name='watchlist'),
    path('add/<str:content_type>/<int:pk>/', views.add_to_watchlist, name='add_to_watchlist'),
    path('remove/<int:pk>/', views.remove_from_watchlist, name='remove_from_watchlist')
]

