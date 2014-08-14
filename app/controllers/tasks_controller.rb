class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)

    if @task.save
      redirect_to [@project], notice: 'Task was successfully created in project.' 
    else
      render action: 'new', notice: 'Error, please try again'
    end
  end

  def task_params
      params.require(:task).permit(:name, :description)
  end

end