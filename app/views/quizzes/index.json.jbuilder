json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :title, :start_time, :end_time
  json.url quiz_url(quiz, format: :json)
end
