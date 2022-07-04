from django.db import models

# Create your models here.

class Artist(models.Model):
    name = models.CharField(max_length = 200)
    biography = models.TextField(max_length = 2000)
    birth_date = models.DateField()
    country = models.CharField(max_length = 200)
    image = models.ImageField(upload_to = "artists", null = True)
    
    def __str__(self):
        return self.name
    
    
class Medium(models.Model):
    description = models.CharField(max_length = 200)
    status = models.BooleanField()

    def __str__(self):
        return self.description
    

class Museum(models.Model):
    
    name = models.CharField(max_length = 200)  
    description = models.TextField(max_length = 2000)
    city = models.CharField(max_length = 200) 
    country = models.CharField(max_length = 200) 
    adress = models.TextField(max_length = 1000) 
    latitude = models.FloatField(null = True)
    longitude = models.FloatField(null = True)
    image = models.ImageField(upload_to = "museums", null = True)

    def __str__(self):
        return self.name

class CulturalProperty(models.Model):
    name = models.CharField(max_length = 200)
    description = models.TextField(max_length = 2000)
    artist = models.ForeignKey(Artist, on_delete = models.CASCADE)
    medium = models.ForeignKey(Medium, on_delete = models.CASCADE)
    museum = models.ForeignKey(Museum, on_delete = models.CASCADE)
    image = models.ImageField(upload_to = "properties", null = True)

    def __str__(self):
        return self.name