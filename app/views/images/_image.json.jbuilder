json.extract! image, :id, :url, :path, :title, :created_at, :updated_at
json.url image_url(image, format: :json)