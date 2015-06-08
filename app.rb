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
end
