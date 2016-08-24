json.extract! phone, :id, :number, :haswp, :operator_id ,:created_at, :updated_at
json.url phone_url(phone, format: :json)