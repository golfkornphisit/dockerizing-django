FROM python:3.13.3-alpine

RUN mkdir /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY docker/backend/requirements.txt /app/requirements.txt
COPY ./backend /app/backend
WORKDIR /app/backend

RUN python -m venv env /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /app/requirements.txt

# Add this to Dockerfile before CMD
RUN addgroup -g 1000 appuser && \
    adduser -D -G appuser -u 1000 appuser

USER appuser

ENV PATH="/py/bin:$PATH"

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]