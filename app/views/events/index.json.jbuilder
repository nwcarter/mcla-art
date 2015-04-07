json.array!(@events) do |event|
  json.extract! event, :id, :title, :location, :about, :history
  json.url event_url(event, format: :json)
end
