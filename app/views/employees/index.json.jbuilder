json.array!(@employees) do |employee|
  json.extract! employee, :id, :username, :name, :job_title, :email, :location_id
  json.url employee_url(employee, format: :json)
end
