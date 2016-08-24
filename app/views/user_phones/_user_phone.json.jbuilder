json.extract! user_phone, :id, :user_id , :phone_id , :created_at, :updated_at
json.url user_phone_url(user_phone, format: :json)