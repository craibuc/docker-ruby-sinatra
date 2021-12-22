FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# all application-specific files will be installed to /src
WORKDIR /src

# copy the Gem specification files to the image
COPY Gemfile Gemfile.lock .

# specify the location of Bundler's settings
ENV BUNDLE_APP_CONFIG /src/.bundle

# configure Bundler to install all Gems (dependencies) to the image's /src/vendor/bundle directory
RUN bundle config set --local path 'vendor/bundle'

# install the Gems
RUN bundle install

# copy all files to the image
COPY . .

# open port 4567
EXPOSE 4567

# start the Sinatra application
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
