#!/bin/sh

# shell will exit if any command returns a non-zero status
set -e

# generate .env file from .env.example
CONFIG_DIR="/app/environment"
HOST_ENV_FILE="$CONFIG_DIR/.env"
EXAMPLE_ENV_FILE="/app/.env.example"
APP_ENV_FILE="/app/.env"

mkdir -p "$CONFIG_DIR"

echo "Checking configuration file..."
# if .env file not found on host， create one from .env.example file
if [ ! -f "$HOST_ENV_FILE" ]; then
  echo "Configuration file not found. Creating a new one from template..."
  cp "$EXAMPLE_ENV_FILE" "$HOST_ENV_FILE"
  echo "New configuration file created at $HOST_ENV_FILE"
  echo "!!! Please review the file, update the variables, and then restart the container. !!!"
  exit
fi
 
# create a symlink from the mounted config file to the app root directory
echo "Linking configuration file..."
ln -sf "$HOST_ENV_FILE" "$APP_ENV_FILE"


# sync the database schema (push) (must be after backup database)
echo "Running database migrations..."

pnpm prisma:push

# start the application
echo "Starting the application..."

exec "$@"