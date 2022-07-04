from django.urls import path, include

from django.urls import path, include
from .views import ArtistViewSet, MediumViewSet, MuseumViewSet, CulturalPropertyViewSet
from rest_framework import routers


router = routers.DefaultRouter()

router.register('artists', ArtistViewSet)
router.register('mediums', MediumViewSet)
router.register('museums', MuseumViewSet)
router.register('properties', CulturalPropertyViewSet)


urlpatterns = [
  path('', include(router.urls))  
]
