from .models import *

from rest_framework import serializers

class ArtistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Artist
        fields = '__all__'


class MediumSerializer(serializers.ModelSerializer):
    class Meta:
        model = Medium
        fields = '__all__'


class MuseumSerializer(serializers.ModelSerializer):
    class Meta:
        model = Museum
        fields = '__all__'


class CulturalPropertySerializer(serializers.ModelSerializer):
    artist = serializers.CharField(read_only = True, source = 'artist.name')
    medium = serializers.CharField(read_only = True, source = 'medium.description')
    museum = serializers.CharField(read_only = True, source = 'museum.name')
    class Meta:
        model = CulturalProperty
        fields = '__all__'