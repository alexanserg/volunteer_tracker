require './lib/volunteer'
require './lib/project'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
also_reload 'lib/**/*.rb'

get ('/') do

end
