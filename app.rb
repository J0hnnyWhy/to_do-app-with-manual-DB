require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
also_reload('/lib/**/*.rb')
require('pg')
require('pry')

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
  @lists = List.all
  erb(:list)
end

post('/lists/:id') do
  list_id = params.fetch('list_id').to_i()
  description = params.fetch('description')
  task = Task.new({:description => description, :list_id => list_id})
  task.save()
  @list = List.find(list_id)
  redirect back
end

get('/lists/:id/edit') do
  @list = List.find(params.fetch("id").to_i)
  @lists = List.all
  erb(:list)
end

patch('/lists/:id') do
  name = params.fetch('name')
  @list = List.find(params.fetch('id').to_i)
  @list.update({:name => name})
  @lists = List.all
  erb(:list)
end


delete('/') do
  @list = List.find(params.fetch("id").to_i)
  @list.delete
  @lists = List.all
  erb(:index)
end
