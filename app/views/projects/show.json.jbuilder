json.extract! @project, :name, :created_at, :updated_at
json.tasks @project.tasks, :id, :name, :description, :status