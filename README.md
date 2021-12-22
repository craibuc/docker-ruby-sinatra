# docker-ruby-sinatra
Docker image and container for Ruby/Sinatra development.

## Usage

### Generate the Gemfile.lock, using the ruby:3.0 image
```bash
make lock
```
### Create an image that will include the dependencies (Gems)
```bash
make build
```
### Run the container (application); attach logging to stdout
```bash
make run
```
### Access the container's terminal
```bash
make tty
```