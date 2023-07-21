FROM ruby:3.2.0

RUN apt-get update -yqq && apt-get install -yqq \
  nodejs \
  apt-utils \ 
  git \
  build-essential \ 
  patch \
  ruby-dev \
  zlib1g-dev \
  liblzma-dev \
  libpq-dev 
ENV BUNDLE_PATH /gems

COPY Gemfile* /usr/src/workspace/ 

WORKDIR /usr/src/workspace/

RUN bundle install 

COPY . /usr/src/workspace/ 

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
