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

get ('/volunteers') do
  @volunteer = Volunteer.all
  erb(:volunteers)
end

get ('/volunteer/:id') do
  @volunteer = Volunteer.find(params[:id])
  erb(:volunteer)
end

get ('/project/:id') do
  @project = Project.find(params[:id])
  erb(:project)
end

get ('/new_project') do
  erb(:new_project)
end

get ('/new_volunteer') do
  erb(:new_volunteer)
end

get("/update_volunteer/:id") do
  @volunteer = Volunteer.find(params[:id])
  erb(:update_volunteer)
end

post ('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  redirect to ('/projects')
end

post ('/volunteers') do
  name = params[:name]
  project_id = params[:project_id]
  volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  volunteer.save
  redirect to ('/projects')
end

patch ('/update_volunteer/:id') do
  @volunteer =Volunteer.find(params[:id])
  @volunteer.update_project(params[:project_id])
  redirect to('/volunteers')
end

delete ('/project/:id') do
  project = Project.find(params[:id].to_i)
  project.delete
  redirect to('/')
end

delete ('/volunteer/:id') do
  volunteer = Volunteer.find(params[:id].to_i)
  volunteer.delete
  redirect to('/')
end
