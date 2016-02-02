class ProjectUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  accepts_nested_attributes_for :user

  attr_accessor :user_id,
                :role
end