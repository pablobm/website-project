FROM elixir:1.9.4-alpine

MAINTAINER Stephen McCullough <stephen.mccullough@gmail.com>

RUN apk add inotify-tools
RUN apk add postgresql-client
RUN apk add nodejs
RUN apk add --update npm

RUN mix local.hex --force
RUN mix local.rebar --force

COPY mix.exs mix.lock /app/
WORKDIR /app
RUN mix deps.get

COPY ./assets/package.json ./assets/package-lock.json /app/assets/
WORKDIR /app/assets
RUN npm install

COPY . /app
WORKDIR /app
