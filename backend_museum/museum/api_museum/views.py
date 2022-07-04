from django.shortcuts import render
from .models import *
from rest_framework import viewsets
from .serializers import ArtistSerializer, MediumSerializer, MuseumSerializer, CulturalPropertySerializer

# Create your views here.

class ArtistViewSet(viewsets.ModelViewSet):
    queryset = Artist.objects.all()
    serializer_class = ArtistSerializer

class MediumViewSet(viewsets.ModelViewSet):
    queryset = Medium.objects.all()
    serializer_class = MediumSerializer

class MuseumViewSet(viewsets.ModelViewSet):
    queryset = Museum.objects.all()
    serializer_class = MuseumSerializer

class CulturalPropertyViewSet(viewsets.ModelViewSet):
    queryset = CulturalProperty.objects.all()
    serializer_class = CulturalPropertySerializer
    
