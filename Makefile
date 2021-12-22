# ensure that the command to be executed is indented by a [tab] character

IMAGE_TAG=ruby-sinatra

lock:

    # bind mount local directory to container, set it as the working directory, then run `bundle lock` to create the Gemfile.lock
	docker run --rm --volume "$(PWD)":/usr/src/app --workdir /usr/src/app ruby:3.0 bundle lock

install:

    # bind mount local directory to container, set it as the working directory, then run `bundle install` to create the Gemfile.lock
# 	docker run --rm --volume "$(PWD)":/usr/src/app --workdir /usr/src/app --env BUNDLE_APP_CONFIG="$(PWD)"/.bundler ruby:3.0 bundle install

build:

	docker build --tag ${IMAGE_TAG} .

run:

    # start application on port 4567
	docker run --rm -d --publish 4567:4567 --volume "$(PWD):/usr/src/app" --name ruby_sinatra ${IMAGE_TAG} bundle exec thin start -R config.ru --port 4567
	docker logs --follow ruby_sinatra

tty:

	docker run --rm -it --volume "$(PWD):/usr/src/app" ${IMAGE_TAG} /bin/bash
