
json.array!(@pins) do |pin|
  json.extract! pin,  :id, :title, :description, :price, :image
  json.url pins_url(pin, format: :json)
end
