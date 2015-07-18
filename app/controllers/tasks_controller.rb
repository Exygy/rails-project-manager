class TasksController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
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

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.update(task_params)

    if @task.save
      redirect_to [@project], notice: 'Task was successfully updated.' 
    else
      render action: 'new', notice: 'Error, please try again'
    end    
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    @task.destroy
  end

  def task_params
      params.require(:task).permit(:name, :description, :difficulty_level)
  end

end