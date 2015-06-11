require('spec_helper')

describe(List) do
  describe('.all') do
    it('is empty at first') do
      expect(List.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('lets you save lists to the database') do
      test_list = List.new({:name => 'Epicodus stuff', :id => 1})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end
  describe('#==') do
    it('is the same list if it has the same name') do
      list1 = List.new({:name => 'Epicodus stuff', :id => nil})
      list2 = List.new({:name => 'Epicodus stuff', :id => nil})
      expect(list1).to(eq(list2))
    end
  end
  describe('.find') do
    it('returns a list by its id') do
      test_list = List.new({:name => 'Epicodus stuff', :id => nil})
      test_list.save()
      test_list2 = List.new({:name => 'Home stuff', :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end
  describe('#tasks') do
    it('returns an array of tasks for that list') do
      test_list = List.new({:name => 'Epicodus stuff', :id => nil})
      test_list.save()
      test_task = Task.new({:description => 'Learn SQL', :list_id => test_list.id()})
      test_task.save()
      test_task2 = Task.new({:description => 'Review Ruby', :list_id => test_list.id()})
      test_task2.save()
      expect(test_list.tasks()).to(eq([test_task, test_task2]))
    end
  end
  describe('#update') do
    it('lets you update a list in the database') do
      list = List.new({:name => "Clean the toilet",  :id => nil})
      list.save
      list.update({:name => "clean the dog"})
      expect(list.name).to(eq('clean the dog'))
    end
  end
  describe('#delete') do
    it('lets you delete a list from the database') do
      list = List.new({:name => 'Epicodus Stuff', :id => nil})
      list.save
      list2 = List.new({:name => 'house stuff', :id => nil})
      list2.save
      list.delete
      expect(List.all).to(eq([list2]))
    end

    it('deletes a list\'s tasks from the database') do
      list = List.new({:name => 'Epicodus Stuff', :id => nil})
      list.save
      task = Task.new({:description => 'learn SQL', :list_id => list.id})
      task.save
      task2 = Task.new({:description => "review ruby", :list_id => list.id})
      task2.save
      list.delete
      expect(Task.all).to(eq([]))
      end
    end


end
