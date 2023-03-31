#!/bin/bash

# Start Elasticsearch
/usr/share/elasticsearch/bin/elasticsearch &
# Wait for Elasticsearch to start
until curl -sS localhost:9200; do
  sleep 1
done

# Reindex searchkick
bundle exec rake searchkick:reindex:all

# Start Rails server
exec "$@"
