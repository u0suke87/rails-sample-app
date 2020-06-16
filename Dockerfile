FROM ruby:2.6.5
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# nodejsとyarnはwebpackをインストールする際に必要
# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
apt-get install nodejs
# yarnパッケージ管理ツール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /rails-sample-app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . /rails-sample-app
