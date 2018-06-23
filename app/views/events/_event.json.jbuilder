json.extract! event, :id, :name, :description, :cost, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
