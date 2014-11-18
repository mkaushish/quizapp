class Question < ActiveRecord::Base
	acts_as_paranoid
	has_many :answers, dependent: :destroy
	has_many :responses, dependent: :destroy
	has_many :user_answers, through: :responses
	has_many :quiz_questions, dependent: :destroy
	has_many :quizzes, through: :quiz_questions
	has_many :user_questions, dependent: :destroy
	has_many :users, through: :user_questions
	accepts_nested_attributes_for :answers, 					reject_if: lambda{ |a| a[:description].blank? }, 			allow_destroy: :true
	#after_save :update_responses
end
