json.array!(@tasks) do |task|
  json.extract! task, :name, :id, :project_id, :difficulty_level, :description
  json.url project_task_url(@project, task, format: :json)
end