#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
# exec rails server -b 0.0.0.0
#bundle exec rails s -p 3000 -b '0.0.0.0'

