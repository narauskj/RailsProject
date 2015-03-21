json.array!(@transfers) do |transfer|
  json.extract! transfer, :id, :date, :asset_id, :employee_id, :location_id, :room, :user_id
  json.url transfer_url(transfer, format: :json)
end
