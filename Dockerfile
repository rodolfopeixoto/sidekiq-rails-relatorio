FROM ruby:2.4.4
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  xvfb \
  qt5-default \
  libqt5webkit5-dev \
  gstreamer1.0-plugins-base \
  gstreamer1.0-tools \
  gstreamer1.0-x

RUN apt-get install -y aptitude
RUN aptitude install -y graphviz

RUN mkdir /jobs-rails
WORKDIR /jobs-rails
COPY Gemfile /jobs-rails/Gemfile
COPY Gemfile.lock /jobs-rails/Gemfile.lock
RUN gem install capybara-webkit -v '1.1.0'
RUN bundle install
COPY . /jobs-rails