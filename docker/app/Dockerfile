FROM ruby:2.4.5

ENV BUNDLER_VERSION 2.0.2

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - \
 && apt-get update \
 && apt-get -y install libpq-dev imagemagick gsfonts nodejs \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /home/app
ENV RAILS_ENV production

ADD . /home/app/donations
WORKDIR /home/app/donations

RUN gem install bundler --version "$BUNDLER_VERSION" --force \
 && gem install rake -v '12.3.2' --force

CMD ["sh", "-c", "bundle install --with development test --path vendor/bundle && bundle exec puma -C config/puma.rb"]
