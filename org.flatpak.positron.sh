#!/bin/sh

# Open firefox to the correct page
python3 -m hypercorn /app/app:app --bind '127.0.0.1:8080' &
/app/firefox/firefox --no-remote --new-instance --profile profile http://127.0.0.1:8080

# Kill the hypercorn server
kill $(ps aux | grep '[h]ypercorn' | awk '{print $2}')