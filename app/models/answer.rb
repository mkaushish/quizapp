class Answer < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :question
	has_many :user_answers, dependent: :destroy

end
