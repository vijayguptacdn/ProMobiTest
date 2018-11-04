json.extract! todo, :id, :name, :description, :assign_user_id, :user_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
