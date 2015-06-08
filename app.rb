require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('/lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => 'to_do'})

get('/') do
  @lists = List.all()
  erb(:index)
end

post('/') do
  name = params.fetch('name')
  list = List.new({:name => name, :id => nil})
  list.save()
  redirect back
end

get('/lists/:id') do
  @list = List.find(params.fetch('id').to_i())
  erb(:list)
end

post('/lists') do
  description = params.fetch('description')
  list_id = params.fetch('list_id').to_i()
  task = Task.new({:description => description, :list_id => list_id})
  task.save()
  redirect back
end
