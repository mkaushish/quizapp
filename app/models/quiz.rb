class Quiz < ActiveRecord::Base
	acts_as_paranoid
	has_many :quiz_questions, dependent: :destroy
	has_many :questions, through: :quiz_questions
	has_many :user_quizzes, dependent: :destroy
	has_many :users, through: :user_quizzes
	has_many :responses
	accepts_nested_attributes_for :quiz_questions, 					reject_if: lambda{ |a| a[:question_id].blank? }, 			allow_destroy: :true
end
