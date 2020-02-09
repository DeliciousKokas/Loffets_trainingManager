FROM ruby:2.6.1

RUN apt-get update -qq && apt-get install -y vim mysql-client imagemagick

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

RUN mkdir /myapp
WORKDIR /myapp

ADD ./Gemfile .
ADD ./Gemfile.lock .
RUN bundle install