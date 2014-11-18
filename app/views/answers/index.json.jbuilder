json.array!(@answers) do |answer|
  json.extract! answer, :id, :description, :checked, :points_c, :points_w
  json.url answer_url(answer, format: :json)
end
