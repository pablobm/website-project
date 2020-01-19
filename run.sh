#!/bin/sh

set -e

until psql -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

mix deps.get
mix ecto.create
mix ecto.migrate

cd assets && npm install && cd ..

mix phx.server
