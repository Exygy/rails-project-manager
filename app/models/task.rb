class Task < ActiveRecord::Base
  belongs_to :project, inverse_of: :tasks
  validates_presence_of :project
  enum status: [:Unstarted, :Started, :Finished]
end