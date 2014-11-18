class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
    
  end

  def show
    
  end

  def new
    @question = Question.new
    #@question.answers.build
    respond_to do |format|
      format.html
      format.js
    end
    
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      @question.user_questions.create(:user_id => current_user.id)
      redirect_to @question
    end
    
  end

  def update
    @question.update(question_params)
    if @question.save
      redirect_to @question
    end
    
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:description, :title, :type, :grading, :survey, answers_attributes: [:description, :points_c, :points_w, :checked, :_destroy, :id], user_questions_attributes: [:user_id, :question_id, :relationship])
    end
end
