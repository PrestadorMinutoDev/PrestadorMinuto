json.extract! account_resource, :id, :parameter, :resource_id , :account_kind_id , :created_at, :updated_at
json.url account_resource_url(account_resource, format: :json)