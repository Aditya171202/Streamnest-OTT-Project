from django.shortcuts import render
from.models import Series

def series_list(request):
    series=Series.objects.all()
    context={
        "series":series
    }
    return render(request,'series_list.html',context)
