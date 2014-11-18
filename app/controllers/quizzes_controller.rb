class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
    @header_title = 'Quizzes'
  end

  def show
    @questions = @quiz.questions.includes(:answers)
    @users = @quiz.users
    @responses = @quiz.responses.includes(:user_answers)
    @responses_by_question = @responses.group_by{|v| v.question_id}
    @responses_by_user = @responses.group_by{|v| v.user_id}
    @responses_by_user_and_question = @responses.group_by{|v| [v.user_id, v.question_id]}
    @header_title = "Quiz #{@quiz.title}"
  end

  def new
    @quiz = Quiz.new
    @header_title = 'New Quiz'
    
  end

  def edit
    @header_title = "Edit Quiz #{@quiz.title}"
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.save
    redirect_to quiz_questions_path(:quiz_id => @quiz.id)
  end

  def update
    @quiz.update(quiz_params)
    redirect_to @quiz
  end

  def destroy
    @quiz.destroy
    
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:title, :start_time, :end_time, quiz_questions_attributes: [:quiz_id, :question_id, :id, :_destroy])
    end
end
