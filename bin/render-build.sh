#!/usr/bin/env bash
set -o errexit

npm install
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
