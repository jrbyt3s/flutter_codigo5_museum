from django.contrib import admin
from api_museum.models import Artist, Medium, Museum, CulturalProperty

# Register your models here.

admin.site.register(Artist)
admin.site.register(Medium)
admin.site.register(Museum)
admin.site.register(CulturalProperty)
