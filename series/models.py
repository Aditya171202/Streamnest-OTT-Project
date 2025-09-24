from django.db import models
from core.models import Genre

class Series(models.Model):
    title=models.CharField(max_length=100)
    description=models.TextField()
    poster=models.ImageField(upload_to='posters/',blank=True,null=True)
    release_date=models.DateField(blank=True,null=True)
    genres = models.ManyToManyField(Genre, blank=True)

    def __str__(self):
        return self.title
    
    def get_type(self):
         return 'series'

class Episode(models.Model):
    series = models.ForeignKey(Series, related_name="episodes", on_delete=models.CASCADE)
    number = models.PositiveIntegerField() 
    title = models.CharField(max_length=200)
    video = models.FileField(upload_to="episodes/")  
    release_date = models.DateField(blank=True, null=True)

    def __str__(self):
        return f"{self.series.title} - Episode {self.number}: {self.title}"
    
