FROM ruby:2.6.5
ENV LANG C.UTF-8
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn

WORKDIR /opt/rails-sample-app
COPY . /opt/rails-sample-app
RUN bundle install && \
    yarn install
CMD bundle exec rails s -p 80 -b '0.0.0.0'
    
