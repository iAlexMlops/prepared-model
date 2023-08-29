FROM python:3.8

USER 0

COPY models/breast_cancer/requirements.txt requirements.txt

RUN pip install --upgrade pip setuptools wheel \
    && pip install -r requirements.txt --no-cache-dir

WORKDIR /app

COPY models /models

RUN chown -R 185 /app && chown -R 185 /usr/local/lib

USER 185
