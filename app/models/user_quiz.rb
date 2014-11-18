class UserQuiz < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :user
	belongs_to :quiz
	has_many :responses, dependent: :destroy
end
