json.array!(@responses) do |response|
  json.extract! response, :id, :question_id, :points, :user_id
  json.url response_url(response, format: :json)
end
