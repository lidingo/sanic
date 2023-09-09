FROM python:3.11-alpine

RUN apk add --no-cache make

WORKDIR /tmp

COPY . /tmp/

RUN make setup

EXPOSE 8000

CMD ["make", "run"]
