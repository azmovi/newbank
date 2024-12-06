FROM docker.io/library/python:3.12-alpine

WORKDIR /catalogo

VOLUME .:/catalogo

EXPOSE 8000

ADD . /catalogo

RUN apk update \
	&& apk upgrade \
	&& pip install --upgrade pip \
	&& pip install -r requirements_dev.txt \
	&& pip cache purge

ENTRYPOINT ["sh", "-c", "alembic upgrade head && uvicorn catalogo.app:app --host=0.0.0.0 --port=8000 --reload"]

