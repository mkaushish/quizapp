class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
    
  end

  def show
    
  end

  def new
    @answer = Answer.new
    
  end

  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.save
  end

  def update
    @answer.update(answer_params)
  end

  def destroy
    @answer.destroy
  end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:description, :checked, :points_c, :points_w)
    end
end
