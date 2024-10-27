FROM ruby:3.3.5-slim

RUN apt-get update -qq && \
    apt-get install -y build-essential libsqlite3-dev nodejs npm

WORKDIR /app

COPY ./Gemfile ./Gemfile.lock ./
RUN bundle install

COPY ./package.json ./package-lock.json ./
RUN npm install 

COPY . .

RUN rails db:migrate

RUN bin/rails assets:precompile

EXPOSE 3000

CMD ["sh", "-c", "rm -f /app/tmp/pids/server.pid && bin/rails server -b 0.0.0.0 "]



