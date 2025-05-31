
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



## Edit Setting.py
```
import os

SECRET_KEY = os.environ.get("DJANGO_SECRET_KEY")

DEBUG = bool(os.environ.get("DEBUG", default=0))

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
---
###RUN

    ```bash
    python3 -m venv env
    ```

    ```bash
    source env/bin/activate
    ```

    ```bash
    docker-compose -f docker-compose.yml up --build -d
    ```

<<<<<<< HEAD
    ```bash
    docker-compose -f docker-compose.yml up --build -d
    ```
---
=======

---
>>>>>>> b85b191 (first commit)
