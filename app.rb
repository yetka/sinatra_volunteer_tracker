require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")


DB = PG.connect({:dbname => "volunteer_tracker_test"})

get("/") do
  @projects = Project.all()
  erb(:index)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

get("/lists") do
  @projects = Project.all()
  erb(:projects_list)
end

get ('/project_voluntreers/:id') do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_voluntreers)
end

get('/project_form') do
  erb(:project_form)
end

post('/projects') do
  name = params.fetch("name")
  project = Project.new({:name => name, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:index)
end

get("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

patch("/projects/:id") do
  name = params.fetch("name")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:name => name})
  @projects = Project.all()
  erb(:index)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end

get '/volunteer_form' do
  @projects = Project.all()
  erb(:volunteer_form)
end

post '/volunteers' do
  name = params.fetch("name")
  project_id = params.fetch("project_id").to_i()
  volunteer = Volunteer.new({:name => name, :project_id => project_id})
  volunteer.save()
  @project = Project.find(project_id)
  @projects = Project.all()
  erb(:index)
end
