# dockerizing-django
How to install

- docker build .
- docker compose build
- docker compose run --rm backend sh -c "django-admin startproject backend ."
- docker compose run --rm backend sh -c "python manage.py makemigrations"
- python3 -m venv env
- source env/bin/activate
- pip install -r requirements.txt
..............................................................................................
EDIT Setting.py

from pathlib import Path
import os


# SECURITY WARNING: keep the secret key used in production secret!

SECRET_KEY = os.environ.get("DJANGO_SECRET_KEY")

# SECURITY WARNING: don't run with debug turned on in production!

DEBUG = bool(os.environ.get("DEBUG", default=0))


ALLOWED_HOSTS = os.environ.get("DJANGO_ALLOWED_HOSTS","127.0.0.1").split(",")

DATABASES = {
    'default': {
        'ENGINE': os.environ.get('SQL_ENGINE', 'django.db.backends.sqlite3'),
        'NAME': os.environ.get('SQL_DATABASE', BASE_DIR / 'db.sqlite3'),
        'USER': os.environ.get('SQL_USER', 'user'),
        'PASSWORD': os.environ.get('SQL_PASSWORD', 'password'),
        'HOST': os.environ.get('SQL_HOST', 'localhost'),
        'PORT': os.environ.get('SQL_PORT', '5432'),
    }
}

- docker compose up --watch --build

....................................................................................