require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def valid_params 
    task = tasks(:first)
    { name: task.name, description: task.description, difficulty_level: task.difficulty_level, project_id: task.project_id}
  end

  def test_invalid_without_task_name
    params = valid_params.clone
    params.delete :name
    task = Task.new params
    refute task.valid?, "Can't be valid without task name"
  end

  def test_invalid_without_task_description
    params = valid_params.clone
    params.delete :description
    task = Task.new params
    refute task.valid?, "Can't be valid without task description"
  end

  def test_invalid_without_task_difficulty_level
    params = valid_params.clone
    params.delete :difficulty_level
    task = Task.new params
    refute task.valid?, "Can't be valid without difficulty_level"
  end

  def test_invalid_without_project_id
    params = valid_params.clone
    params.delete :project_id
    task = Task.new params
    refute task.valid?, "Can't be valid without project_id"
  end

  def test_tasks_belong_to_project
    params = valid_params.clone
    task = Task.create params
    assert_respond_to(task, :project)
  end  

end
