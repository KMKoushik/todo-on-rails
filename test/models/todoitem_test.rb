require 'test_helper'

class TodoitemTest < ActiveSupport::TestCase
  test 'Should not save todoitem without todo' do
    todo = Todoitem.new
    assert_not todo.save
  end

  test 'Should save valid todo item' do
    todo = Todoitem.new
    todo.todo = 'sample checklist'
    todo.task_id = tasks(:two).id
    assert todo.save
  end
end
