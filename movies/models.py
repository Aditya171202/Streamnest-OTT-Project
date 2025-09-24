from django.db import models
from core.models import Genre


    
class Movie(models.Model):
    title=models.CharField(max_length=100)
    description=models.TextField()
    poster=models.ImageField(upload_to='posters/',blank=True,null=True)
    release_date=models.DateField(blank=True,null=True)
    video = models.FileField(upload_to='videos/', blank=True, null=True)
    genres = models.ManyToManyField(Genre, blank=True)

    def __str__(self):
        return self.title
    
    def get_type(self):
        return 'movie'

class ComingSoon(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    release_date = models.DateField()
    poster = models.ImageField(upload_to='comingsoon_posters/')
    trailer_url = models.URLField(blank=True, null=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
        

