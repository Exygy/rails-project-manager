class Project < ActiveRecord::Base
  has_many :project_users
  has_many :users, through: :project_users

  has_many :tasks, inverse_of: :project
  accepts_nested_attributes_for :tasks
  before_destroy :destroy_unless_started_tasks

  private

  def destroy_unless_started_tasks

    tasks.each do |task|
      if task.status == 1 || task.status == 2
        return false
      end
    end
  end

end
