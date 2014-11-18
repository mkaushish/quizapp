class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  def index
    @responses = Response.all
  end

  def show
    #Response.calculate_points(@response)
    @question = @response.question
    @answers = @question.answers
    @user_answers = @response.user_answers.group_by{|v| v.answer_id}
  end

  def new
    @question = Question.find(params[:question_id])
    @response = Response.new
    @question.answers.each{|v| @response.user_answers.build}
  end

  def edit
  end

  def create
    @response = Response.new(response_params)
    if @response.save
      Response.calculate_points(@response)
      redirect_to @response
    end
  end

  def update
    if @response.update(response_params)
      Response.calculate_points(@response)
      redirect_to @response
    end
    
  end

  def destroy
    @response.destroy
    
  end

  private
    def set_response
      @response = Response.find(params[:id])
    end

    def response_params
      params.require(:response).permit(:question_id, :points, :user_id, user_answers_attributes: [:response_id, :points, :answer_id, :correct, :checked])
    end
end
