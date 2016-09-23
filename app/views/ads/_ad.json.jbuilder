json.extract! ad, :id, :description, :rating_avg, :adscol, :profession_id , :created_at, :updated_at
json.url ad_url(ad, format: :json)