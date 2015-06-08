require('spec_helper')

describe(Task) do
  describe('.all') do
    it('is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end
end
