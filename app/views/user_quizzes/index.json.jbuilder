json.array!(@user_quizzes) do |user_quiz|
  json.extract! user_quiz, :id, :user_id, :quiz_id, :relationship
  json.url user_quiz_url(user_quiz, format: :json)
end
