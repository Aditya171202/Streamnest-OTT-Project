from django.db import models
from django.contrib.auth.models import User
from movies.models import Movie
from series.models import Series

class WatchlistItem(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, blank=True, null=True)
    series = models.ForeignKey(Series, on_delete=models.CASCADE, blank=True, null=True)
    added_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        if self.movie:
            return f"{self.user.username} - {self.movie.title}"
        if self.series:
            return f"{self.user.username} - {self.series.title}"
        return f"{self.user.username} - Empty"
