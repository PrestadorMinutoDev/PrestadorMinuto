json.extract! user, :id, :name, :number, :haswp , :doc, :birthdate, :email, :last_logon, :certdate, :created_at, :updated_at
json.url user_url(user, format: :json)