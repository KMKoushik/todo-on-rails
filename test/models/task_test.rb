require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'Should not save task without name' do
    task = Task.new
    assert_not task.save
  end

  test 'Should not save task without user_id' do
    task = Task.new
    task.name = 'sample'
    assert_not task.save
  end

  test 'Should save valid task' do
    task = Task.new
    task.name = 'sample'
    task.user_id = users(:one).id
    assert task.save
  end
end
