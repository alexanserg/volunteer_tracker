require './lib/volunteer'
require './lib/project'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
also_reload 'lib/**/*.rb'

DB = PG.connect({:dbname => 'volunteer_tracker'})

get ('/') do
 redirect to('/projects')
end

get ('/projects') do
  @project = Project.all
  erb(:projects)
end

get ('/project/:id') do
  @project = Project.find(params[:id])
  erb(:project)
end

get ('/new_project') do
  erb(:new_project)
end

post ('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  redirect to ('/projects')
end

delete ('/project/:id') do
  project = Project.find(params[:id].to_i)
  project.delete
  redirect to('/')
end
