FROM python:3.13.3-alpine

ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt /requirements.txt
COPY ./backend /usr/src/app/backend/
WORKDIR /usr/src/app/backend/

RUN python -m venv env /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /requirements.txt

RUN addgroup -g 1000 appuser && \
    adduser -D -G appuser -u 1000 appuser

USER appuser

ENV PATH="/py/bin:$PATH"

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]