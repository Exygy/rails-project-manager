class Task < ActiveRecord::Base
  validates :name, :description, :difficulty_level, :project_id, presence: true
  belongs_to :project
end
