FROM ruby:2.3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /responsible-coders-manifesto
WORKDIR /responsible-coders-manifesto
ADD Gemfile /responsible-coders-manifesto/Gemfile
ADD Gemfile.lock /responsible-coders-manifesto/Gemfile.lock
RUN bundle install
ADD . /responsible-coders-manifesto
