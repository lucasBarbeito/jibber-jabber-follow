#!/bin/ba
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /jibber-jabber-follow/tmp/pids/server.pid

rails db:create

rails db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
