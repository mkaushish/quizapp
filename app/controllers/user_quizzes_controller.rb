class UserQuizzesController < ApplicationController
  before_action :set_user_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @user_quizzes = UserQuiz.all
  end

  def show
    
  end

  def new
    if defined? params and !params['quiz_id'].blank?
      @user_quiz = UserQuiz.where('quiz_id = ? AND user_id = ?', params['quiz_id'], current_user.id)
      if @user_quiz.blank?
        @user_quiz = UserQuiz.create(:quiz_id => quiz_id, :user_id => current_user.id)
        @user_quiz.questions.each{|v| v.responses.create(:user_quiz_id => @user_quiz.id, :user_id => current_user.id, :row_order => v.row_order)}
      else
        @user_quiz = @user_quiz.first
      end
      @quiz =  @user_quiz.quiz
      @responses = @user_quiz.responses.order(:row_order)
      @question_ids = @responses.group_by{|v| v.question_id}
      if !params['question_id'].blank?
        question_id = params['question_id']
      elsif !@user_quiz.question_id.blank?
        question_id = @user_quiz.question_id
      else
        question_id = @questions[0]
      end
      @response = @question_ids[question_id]
      @position = @responses.index[@response]
      if @position > 0
        @previous_response = @responses[@position - 1]
      else
        @previous_response = nil
      end
      if @position < @response.length - 1
        @next_response = @responses[@position + 1]
      else
        @next_response = nil
      end    
    end
  end

  def edit
  end

  def create
    @user_quiz = UserQuiz.new(user_quiz_params)
    @user_quiz.save
    
  end

  def update
    @user_quiz.update(user_quiz_params)
    
  end

  def destroy
    @user_quiz.destroy
    
  end

  private
    def set_user_quiz
      @user_quiz = UserQuiz.find(params[:id])
    end

    def user_quiz_params
      params.require(:user_quiz).permit(:user_id, :quiz_id, :relationship)
    end
end
