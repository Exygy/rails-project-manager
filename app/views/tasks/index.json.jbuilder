json.array!(@tasks) do |task|
  json.extract! task, :name
  json.extract! task, :description
  json.extract! task, :status
  json.url task_url(task, format: :json)
end
