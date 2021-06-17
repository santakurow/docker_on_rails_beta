#!/bin/bash
set -e

echo "<================== Build ==================>" 
docker-compose build

echo "<================== Rails New ==================>"
docker-compose run --rm app rails new . -d mysql -T

echo "<================== Rails Setup ==================>"
docker-compose run --rm app rails app:template LOCATION=./init.rb

echo "<================== Insert .gitignore & .rspec ==================>"
cat >> .gitignore << EOF
# Not deleted!
.env
# For docker-sync
/.docker-sync
EOF

echo "--format documentation" >> .rspec

echo "<================== DB Create ==================>"
docker-compose run --rm app rails db:create

echo "Complete! Let's 'docker-compose up'!"