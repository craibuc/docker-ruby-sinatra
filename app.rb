require "bundler/setup"
require "sinatra"

Bundler.require

set :bind, '0.0.0.0'

get "/" do
  "Hello, world!"
end
