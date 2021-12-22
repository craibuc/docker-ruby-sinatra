FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /src

COPY Gemfile Gemfile.lock .

ENV BUNDLE_APP_CONFIG /src/.bundle

RUN bundle config set --local path 'vendor/bundle'
RUN bundle install

COPY . .

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
