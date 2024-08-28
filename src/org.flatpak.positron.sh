#!/bin/sh

# Copy the profile directory to the correct location
PROFILE_DIR="$HOME/.var/app/org.flatpak.positron/data/profile"
if [ ! -d "$PROFILE_DIR" ]; then
    cp -r /app/profile "$PROFILE_DIR"
fi

# Start the hypercorn server
python3 -m hypercorn /app/app:app --bind '127.0.0.1:8080' &
HYPERCORN_PID=$!
echo "Hypercorn PID: $HYPERCORN_PID"

# Start Firefox
/app/firefox/firefox --no-remote --new-instance --profile "$PROFILE_DIR" --url http://127.0.0.1:8080

# Kill the hypercorn server
kill $HYPERCORN_PID