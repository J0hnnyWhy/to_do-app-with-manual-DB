class Task
  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec('SELECT * FROM tasks;')
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch('description')
      tasks.push(Task.new({:desription => description}))
    end
    tasks
  end   
end
