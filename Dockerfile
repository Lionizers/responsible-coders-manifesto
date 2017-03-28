FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /manifesto
WORKDIR /manifesto
ADD Gemfile /manifesto/Gemfile
ADD Gemfile.lock /manifesto/Gemfile.lock
RUN bundle install
ADD . /manifesto
