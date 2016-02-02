class Project < ActiveRecord::Base
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users

  has_many :tasks, dependent: :destroy, inverse_of: :project
  accepts_nested_attributes_for :tasks, allow_destroy: true


  private

  # Can this user modify this project?
  def can_modify_project?
    if (user_signed_in? && current_user.projects.where(project_id = params[:id]).exists?) || (current_user.project_users.where(project_id = params[:id]) == User::ROLE[:admin])
      return true
    else
      #return false
    end
  end

end