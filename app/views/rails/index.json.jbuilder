json.array!(@rails) do |rail|
  json.extract! rail, :id, :g, :resource, :places
  json.url rail_url(rail, format: :json)
end
