#!/bin/bash

# Function to replace environment variables
replace_env_vars() {
  local file=$1
  [ -f "$file" ] || return 0
  
  sed -i "s|VITE_FIREBASE_API_KEY|$VITE_FIREBASE_API_KEY|g" "$file"
  sed -i "s|VITE_FIREBASE_AUTH_DOMAIN|$VITE_FIREBASE_AUTH_DOMAIN|g" "$file"
  sed -i "s|VITE_FIREBASE_PROJECT_ID|$VITE_FIREBASE_PROJECT_ID|g" "$file"
  sed -i "s|VITE_FIREBASE_STORAGE_BUCKET|$VITE_FIREBASE_STORAGE_BUCKET|g" "$file"
  sed -i "s|VITE_FIREBASE_MESSAGING_SENDER_ID|$VITE_FIREBASE_MESSAGING_SENDER_ID|g" "$file"
  sed -i "s|VITE_FIREBASE_APP_ID|$VITE_FIREBASE_APP_ID|g" "$file"
  sed -i "s|VITE_FIREBASE_MEASUREMENT_ID|$VITE_FIREBASE_MEASUREMENT_ID|g" "$file"
}

# Replace environment variables in all JS files
find /usr/share/nginx/html -type f -name "*.js" -exec bash -c 'replace_env_vars "$0"' {} \;

# Start nginx
nginx -g "daemon off;"