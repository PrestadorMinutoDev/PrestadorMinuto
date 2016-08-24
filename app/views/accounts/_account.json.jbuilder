json.extract! account, :id, :account_status, :user_id , :account_kinds_id, :created_at, :updated_at
json.url account_url(account, format: :json)