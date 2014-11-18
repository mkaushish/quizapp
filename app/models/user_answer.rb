class UserAnswer < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :answer
	belongs_to :response
end
