class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :responses, dependent: :destroy
  has_many :user_quizzes, dependent: :destroy
  has_many :quizzes, through: :user_quizzes 
  has_many :user_questions, dependent: :destroy
  has_many :questions, through: :user_questions 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_paranoid
end
