json.extract! pin, :id, :title, :description, :price, :image, :created_at, :updated_at
json.url pin_url(pin, format: :json)
