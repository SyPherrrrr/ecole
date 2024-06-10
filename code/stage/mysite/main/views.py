from django.shortcuts import render
from django.http import HttpResponse

from main.models import Article


# Create your views here.

def home(response):
    return HttpResponse("<h1>Hello</h1>")


def articles(request):
    articles = Article.objects.all()
    return render(request, 'home.html', {'articles': articles})

