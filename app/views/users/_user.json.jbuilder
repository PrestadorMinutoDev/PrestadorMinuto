json.extract! user, :id, :name, :number, :haswp , :doc, :birthdate, :email, :last_logon, :certdate, :pwd , :pwd_confirmation ,:created_at, :updated_at
json.url user_url(user, format: :json)