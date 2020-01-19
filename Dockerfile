FROM elixir:1.9.4-alpine

MAINTAINER Stephen McCullough <stephen.mccullough@gmail.com>

RUN apk add inotify-tools
RUN apk add postgresql-client
RUN apk add nodejs
RUN apk add --update npm

COPY . /app
WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force
