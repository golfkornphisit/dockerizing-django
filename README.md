
1. **Clone the repository:**
    ```bash
    git clone https://github.com/golfkornphisit/dockerizing-django.git 
    ```
2. **Change directory into the project:**
    ```bash
    cd dockerizing-django
    ```
3. **Copy the `env.example` file to `.env` and update the values as needed:**  

   - **For Linux/macOS:**  
     ```bash
     cp env.example .env
     ```
   - **For Windows (Command Prompt):**  
     ```cmd
      Copy-Item -Path env.example -Destination .env
     ```

---

## Initial Setup ⚙️

### Development Prerequisites

1. Create folder "backend"

2. RUN

    ```bash
    docker compose build
    ```

    ```bash
    docker compose run --rm backend sh -c "django-admin startproject backend ."
    ```

---

## Edit Setting.py

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

---
###RUN
    ```bash
    python3 -m venv env
    ```

    ```bash
    source env/bin/activate
    ```

    ```bash
    pip install -r docker/backend/requirements.txt
    ```
---