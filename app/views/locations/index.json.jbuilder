json.array!(@locations) do |location|
  json.extract! location, :id, :country, :city, :site_code, :address
  json.url location_url(location, format: :json)
end
