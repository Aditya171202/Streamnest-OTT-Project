from django.urls import path
from . import views
from watchlist.views import add_to_watchlist

urlpatterns = [
    path('search/', views.search, name='search'),
    path('watchlist/add/<str:type>/<int:id>/', add_to_watchlist, name='add_to_watchlist'),  
    path('genre/<int:genre_id>/', views.genre_results, name='genre_results')
]
