class Response < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :user
	belongs_to :question
	belongs_to :user_quiz
	belongs_to :quiz, through: :user_quiz
	has_many :user_answers, dependent: :destroy
	accepts_nested_attributes_for :user_answers, 			allow_destroy: :true

	def self.calculate_points(response)
		user_answers = response.user_answers
		user_answers.each do |ua|
			answer = ua.answer
			if answer.checked == ua.checked
				ua.update_attributes(:points => answer.points_c, :correct => true)
			else
				ua.update_attributes(:points => answer.points_w, :correct => false)
			end
		end
		response.points = user_answers.map{|v| v.points}.compact.reduce(:+)
		response.save
	end
	def self.calculate_multiple(responses)
		responses.each{|v| self.calculate_points(v)}
	end
end