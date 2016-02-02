class Project < ActiveRecord::Base
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users

  has_many :tasks, dependent: :destroy, inverse_of: :project
  accepts_nested_attributes_for :tasks, allow_destroy: true


end