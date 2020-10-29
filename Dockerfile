FROM ruby:2.6.6

RUN apt-get update -qq && \
    apt-get install -y mariadb-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /kokoita

WORKDIR /kokoita

ADD Gemfile /kokoita/Gemfile
ADD Gemfile.lock /kokoita/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /kokoita