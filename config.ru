require 'rubygems'
require 'sinatra'
require './app'

set :environment, :development
set :bind, '0.0.0.0'
set :port, 9292

Sinatra::Application.run!
