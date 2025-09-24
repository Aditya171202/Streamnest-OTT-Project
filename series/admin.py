from django.contrib import admin
from .models import Series, Episode

class EpisodeInline(admin.TabularInline): 
    model = Episode
    extra = 1   
@admin.register(Series)
class SeriesAdmin(admin.ModelAdmin):
    list_display = ("title", "release_date")
    inlines = [EpisodeInline] 

@admin.register(Episode)
class EpisodeAdmin(admin.ModelAdmin):
    list_display = ("series", "number", "title", "release_date")
    list_filter = ("series",)

