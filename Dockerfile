FROM python:3.8-slim

USER 0

COPY models/breast_cancer/requirements.txt requirements.txt

RUN --mount=type=cache,target=/cache \
    pip install -r requirements.txt --no-cache-dir

WORKDIR /app

COPY models /models

RUN chown -R 185 /app && chown -R 185 /usr/local/lib

USER 185
