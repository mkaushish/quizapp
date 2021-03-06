require 'test_helper'

class QuizQuestionsControllerTest < ActionController::TestCase
  setup do
    @quiz_question = quiz_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quiz_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz_question" do
    assert_difference('QuizQuestion.count') do
      post :create, quiz_question: { question_id: @quiz_question.question_id, quiz_id: @quiz_question.quiz_id, serial_no: @quiz_question.serial_no }
    end

    assert_redirected_to quiz_question_path(assigns(:quiz_question))
  end

  test "should show quiz_question" do
    get :show, id: @quiz_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz_question
    assert_response :success
  end

  test "should update quiz_question" do
    patch :update, id: @quiz_question, quiz_question: { question_id: @quiz_question.question_id, quiz_id: @quiz_question.quiz_id, serial_no: @quiz_question.serial_no }
    assert_redirected_to quiz_question_path(assigns(:quiz_question))
  end

  test "should destroy quiz_question" do
    assert_difference('QuizQuestion.count', -1) do
      delete :destroy, id: @quiz_question
    end

    assert_redirected_to quiz_questions_path
  end
end
