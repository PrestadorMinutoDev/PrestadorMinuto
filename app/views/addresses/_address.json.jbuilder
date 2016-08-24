json.extract! address, :id, :zip, :address1, :address2, :address3, :city_id, :state_id, :country_id , :created_at, :updated_at
json.url address_url(address, format: :json)