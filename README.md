git clone https://github.com/golfkornphisit/dockerizing-django.git       
cd dockerizing-django

Create folder "backend"

RUN
docker compose build
docker compose run --rm backend sh -c "django-admin startproject backend ."

Create .env

DJANGO_SECRET_KEY=your_secret_key
DEBUG=True
DJANGO_LOGLEVEL=info
DJANGO_ALLOWED_HOSTS=localhost
DATABASE_ENGINE=postgresql_psycopg2
DATABASE_NAME=dockerdjango
DATABASE_USERNAME=dbuser
DATABASE_PASSWORD=dbpassword
DATABASE_HOST=db
DATABASE_PORT=5432
PGADMIN_MAIL=your@email.com
PGADMIN_PW=changeit

Edit settings.py
ADD
import os

# SECURITY WARNING: keep the secret key used in production secret!
# SECRET_KEY = 'django-insecure-q%hy#5z54pu$8r*vk($udfpp3%%s79y&pmy@&d4)8a+9_g2qi('
SECRET_KEY = os.environ.get("DJANGO_SECRET_KEY")

# SECURITY WARNING: don't run with debug turned on in production!
# DEBUG = True
DEBUG = bool(os.environ.get("DEBUG", default=0))

# ALLOWED_HOSTS = []
ALLOWED_HOSTS = os.environ.get("DJANGO_ALLOWED_HOSTS","127.0.0.1").split(",")

DATABASES = {
    'default': {
         'ENGINE': 'django.db.backends.postgresql',
         'NAME': os.getenv('DATABASE_NAME'),
         'USER': os.getenv('DATABASE_USERNAME'),
         'PASSWORD': os.getenv('DATABASE_PASSWORD'),
         'HOST': os.getenv('DATABASE_HOST'),
         'PORT': os.getenv('DATABASE_PORT'),
    }
}

RUN
python3 -m venv env
source env/bin/activate
pip install -r docker/backend/requirements.txt