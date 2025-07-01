#!/usr/bin/env bash
set -e

echo "🚀 Paso 1: Compilando SDK de Chatwoot..."
NODE_OPTIONS=--max-old-space-size=16384 pnpm run build:sdk
echo "✅ SDK compilado."

echo "🚀 Paso 2: Compilando assets con SECRET_KEY_BASE..."
SECRET_KEY_BASE=6ee24b067db20b5d9896d6d60159fa8ede75f3a8e343b955f9e77825030d938cb37ef77784c0112ebf918ae13a90e2919f401a6f1eddff52f7210c4901b64fba \
NODE_OPTIONS=--max-old-space-size=2048 \
RAILS_ENV=production bundle exec rake assets:precompile

echo "✅ Assets compilados. Build finalizado 🎉"