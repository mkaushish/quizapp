class UserQuestionsController < ApplicationController
  before_action :set_user_question, only: [:show, :edit, :update, :destroy]

  def index
    @user_questions = UserQuestion.where('user_id = ?', current_user.id)
    @questions = Question.where('id IN (?)', @user_questions.map{|v| v.question_id})
  end

  def show
    
  end

  def new
    @user_question = UserQuestion.new
    
  end

  def edit
  end

  def create
    @user_question = UserQuestion.new(user_question_params)
    @user_question.save
    
  end

  def update
    @user_question.update(user_question_params)
    
  end

  def destroy
    @user_question.destroy
    
  end

  private
    def set_user_question
      @user_question = UserQuestion.find(params[:id])
    end

    def user_question_params
      params.require(:user_question).permit(:user_id, :question_id, :relationship)
    end
end
