require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def setup
    TaskManager.create({ :title => "title 1",
                         :description => "description 1"})
    TaskManager.create({ :title => "title 2",
                         :description => "description 2"})
  end

  def test_it_creates_a_task
    task = TaskManager.find(TaskManager.all.first.id)
    assert_equal "title 1", task.title
    assert_equal "description 1", task.description
    assert_equal TaskManager.all.first.id, task.id
  end

  def test_it_queries_all_tasks
    tasks = TaskManager.all
    assert_equal 2, tasks.count
  end

  def test_it_finds_a_task
    task = TaskManager.find(2)
    assert_equal "title 2", task.title
  end

  def test_it_can_update_a_task
    TaskManager.update(1, { :title => "title 1 updated",
                                  :description => "description 1 updated" })
    # task = TaskManager.find(1)
    assert_equal "title 1 updated", TaskManager.find(1).title
    assert_equal "description 1 updated", TaskManager.find(1).title
    # assert_equal 1, task.id
  end

  def test_it_can_destroy_a_task
    TaskManager.delete(TaskManager.all.last.id)
    tasks = TaskManager.all
    assert_equal 1, tasks.count
  end
end
