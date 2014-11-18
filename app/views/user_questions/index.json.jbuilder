json.array!(@user_questions) do |user_question|
  json.extract! user_question, :id, :user_id, :question_id, :relationship
  json.url user_question_url(user_question, format: :json)
end
