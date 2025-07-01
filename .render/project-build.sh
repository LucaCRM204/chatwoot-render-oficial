#!/usr/bin/env bash

corepack enable

pnpm install --no-frozen-lockfile

cd app/javascript

pnpm run build:sdk

cd ../../

RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Build terminado correctamente"
