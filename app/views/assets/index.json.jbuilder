json.array!(@assets) do |asset|
  json.extract! asset, :id, :asset_type, :asset_tag, :serial_nr, :po, :po_date, :price, :lifecycle, :make, :model, :is_used, :is_assigned, :is_supported
  json.url asset_url(asset, format: :json)
end
