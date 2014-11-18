class QuizQuestion < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :question
	belongs_to :quiz
	include RankedModel
  	ranks :row_order
end
