1. Crear la carpeta Project_Museum2. Crear nuestro entorno virtual	python3 -m venv myvenv3. Activar entorno virtual	windows: myvenv\Scripts\activate	Mac:  source myvenv/bin/activate
	
	pip install Django==4.0.5

	validar instalaciones: pip freeze --local

4. Crear el proyecto Django museum
	
	django-admin startproject museum

5. Entrar a la capeta del proyecto

	python -m pip install Pillow

6. Validar que esta up el proyecto

	python manage.py runserver

7. Realizar la migración para levantar el entorno administrador
	
	python manage.py migrate

8. Crear el usuario y password administrador
	
	python manage.py createsuperuser

9. Corre el proyecto e ir a la url: http://127.0.0.1:8000/admin/

	python manage.py runserver

	entrar con user admin y pasword admin

10. Crear APP Django llamado api_museum

	python manage.py startapp api_museum

11. En Setting.py declarar la app creada: (Se agrega la ultima linea:)

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'api_museum'
]

12. Crear los modelos en models.py:

class Artist(models.Model):
    name = models.CharField(max_length = 200)
    biography = models.TextField(max_length = 2000)
    birth_date = models.DateField()
    country = models.CharField(max_length = 200)
    image = models.ImageField(upload_to = "artists", null = True)
    
    
class Medium(models.Model):
    description = models.CharField(max_length = 200)
    status = models.BooleanField()
    

class Museum(models.Model):
    
    name = models.CharField(max_length = 200)  
    description = models.TextField(max_length = 2000)
    city = models.CharField(max_length = 200) 
    country = models.CharField(max_length = 200) 
    adress = models.TextField(max_length = 1000) 
    latitude = models.FloatField(null = True)
    longitude = models.FloatField(null = True)
    image = models.ImageField(upload_to = "museums", null = True)


class CulturalProperty(models.Model):
    name = models.CharField(max_length = 200)
    description = models.TextField(max_length = 2000)
    artist = models.ForeignKey(Artist, on_delete = models.CASCADE)
    medium = models.ForeignKey(Medium, on_delete = models.CASCADE)
    museum = models.ForeignKey(Museum, on_delete = models.CASCADE)
    image = models.ImageField(upload_to = "properties", null = True)


13. En admin.py declarar los modelos creados:from api_museum.models import Artist, Medium, Museum, CulturalProperty

		# Register your models here.

		admin.site.register(Artist)
		admin.site.register(Medium)
		admin.site.register(Museum)
		admin.site.register(CulturalProperty)

14. Hace las migraciones:	 python manage.py makemigrations

15. Luego migrar:

	python manage.py migrate

======= serializer =

Intalar Django REST Framework

pip install djangorestframework
pip install markdown       # Markdown support for the browsable API.
pip install django-filter

- En settings .py agregar la linea: 'rest_framework',

INSTALLED_APPS = [
    ...
    'rest_framework',
]

- Creamos  la vista con el el archivo: view.py a la altura de api_museum 