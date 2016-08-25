json.extract! register_user, :name,  :created_at, :updated_at
json.url register_user_url(register_user, format: :json)