json.extract! user, :id, :name, :postal_code, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
