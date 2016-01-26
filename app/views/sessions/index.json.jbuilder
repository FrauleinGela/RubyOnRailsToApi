json.array!(@sessions) do |session|
  json.extract! session, :id, :name,:dateStart,:counterfavs
  json.url session_url(session, format: :json)
end
