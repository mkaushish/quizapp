class QuizQuestionsController < ApplicationController
  before_action :set_quiz_question, only: [:show, :edit, :update, :destroy]

  def index
    if defined? params and !params['quiz_id'].blank?
      unless params['question_id'].blank?
        QuizQuestion.create(:question_id => params['question_id'], :quiz_id => params['quiz_id'])
      end
      unless params['quiz_question_id'].blank?
        if(params['operation'] == 'remove')
          QuizQuestion.find(params['quiz_question_id']).delete
        end
      end
      @quiz_questions = QuizQuestion.includes(:question).where('quiz_id = ?', params['quiz_id']).order(:row_order)
      @quiz = Quiz.find(params['quiz_id'])
      @header_title = "Quiz - #{@quiz.title}"
    else
      @quiz_questions = QuizQuestion.all
    end
    unless @quiz_questions.blank?
      @questions = Question.where('id NOT IN (?)', @quiz_questions.map{|v| v.question_id})
    else
      @questions = Question.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    
  end

  def new
    @quiz_question = QuizQuestion.find(quiz_question_params[:quiz_question_id])
    @quiz_question.row_order_position = quiz_question_params[:row_order_position]
    @quiz_question.save

    render nothing: true
  end

  def edit
  end

  def create
    @quiz_question = QuizQuestion.new(quiz_question_params)
    @quiz_question.save
    
  end

  def update
    @quiz_question.update(quiz_question_params)
    
  end

  def destroy
    @quiz_question.destroy
    
  end
  def update_row_order
    @quiz_question = QuizQuestion.find(quiz_question_params[:quiz_question_id])
    @quiz_question.row_order_position = quiz_question_params[:row_order_position]
    @quiz_question.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private
    def set_quiz_question
      @quiz_question = QuizQuestion.find(params[:id])
    end

    def quiz_question_params
      params.require(:quiz_question).permit(:quiz_id, :question_id, :serial_no, :quiz_question_id, :row_order_position, :id, :row_order)
    end
end
