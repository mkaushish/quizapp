class UserAnswersController < ApplicationController
  before_action :set_user_answer, only: [:show, :edit, :update, :destroy]

  def index
    @user_answers = UserAnswer.all
    
  end

  def show
    
  end

  def new
    @user_answer = UserAnswer.new
    
  end

  def edit
  end

  def create
    @user_answer = UserAnswer.new(user_answer_params)
    @user_answer.save
    
  end

  def update
    @user_answer.update(user_answer_params)
    
  end

  def destroy
    @user_answer.destroy
    
  end

  private
    def set_user_answer
      @user_answer = UserAnswer.find(params[:id])
    end

    def user_answer_params
      params.require(:user_answer).permit(:response_id, :points, :answer_id, :correct)
    end
end
