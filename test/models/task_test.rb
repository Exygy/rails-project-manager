require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should not save task without task name" do
    task = tasks(:first)
    assert_not task.save, "Saved the task without a task name"
  end

end
