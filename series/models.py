from django.db import models

class Series(models.Model):
    title=models.CharField(max_length=100)
    description=models.TextField()
    poster=models.ImageField(upload_to='posters/',blank=True,null=True)
    release_date=models.DateField(blank=True,null=True)

    def __str__(self):
        return self.title