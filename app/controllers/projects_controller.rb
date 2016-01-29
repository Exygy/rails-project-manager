class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.page(params[:page]).per(10)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show

  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.tasks.build
  end

  # GET /projects/1/edit
  def edit
    if can_modify_project?
      # then allow normal access
    else
      # otherwise disallow action and redirct to project listing page
        redirect_to projects_url, notice: 'You do not have permission to edit this project.'
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.tasks.build

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if can_modify_project?
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to @project, notice: 'Project was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to projects_url, notice: 'You do not have permission to update this project.'
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if can_modify_project?
      respond_to do |format|
        if @project.destroy
          format.html { redirect_to projects_url }
          format.json { head :no_content }
        else
          format.html { redirect_to projects_url, notice: 'Cannot delete project until started and finished tasks are removed.' }
        end
      end
    else
      redirect_to projects_url, notice: 'You do not have permission to delete this project.'
    end
  end

  private
    # Can this user modify this project?
    def can_modify_project?
      if user_signed_in? && @project.users.where(user_id: current_user) || current_user == User::ROLE[:admin]
        return true
      else
        return false
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, tasks_attributes: [ :id, :name, :description, :status ])
    end
end
