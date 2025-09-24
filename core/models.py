from django.db import models

class Genre(models.Model):
    GENRE_TYPE = [
        ('movie', 'Movie'),
        ('series', 'Series'),
    ]
    name = models.CharField(max_length=50, unique=True)
    category = models.CharField(
    max_length=10,
    choices=GENRE_TYPE,
    default='movie'  
)

    def __str__(self):
        return self.name

