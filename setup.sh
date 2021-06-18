#!/bin/bash
set -e

mv README.md README.md.tmp

echo "<================== Build ==================>" 
docker-compose build

echo "<================== Rails New ==================>"
docker-compose run --rm app rails new . -d mysql -fT

echo "<================== Add Gemfile ==================>"
cat >> Gemfile << EOF
group :development, :test do
  gem 'rspec-rails'
end

gem 'rubocop-rails', require: false
gem 'dotenv-rails'
EOF

echo "<================== Bundle Install ==================>"
docker-compose run --rm app bundle install

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

echo "<================== Update README.md ==================>"

rm -f README.md
mv README.md.tmp README.md

echo "<================== DB Create ==================>"
docker-compose run --rm app rails db:create

echo "Complete! Let's 'docker-compose up'!"