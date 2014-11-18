require 'test_helper'

class UserQuizzesControllerTest < ActionController::TestCase
  setup do
    @user_quiz = user_quizzes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_quizzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_quiz" do
    assert_difference('UserQuiz.count') do
      post :create, user_quiz: { quiz_id: @user_quiz.quiz_id, relationship: @user_quiz.relationship, user_id: @user_quiz.user_id }
    end

    assert_redirected_to user_quiz_path(assigns(:user_quiz))
  end

  test "should show user_quiz" do
    get :show, id: @user_quiz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_quiz
    assert_response :success
  end

  test "should update user_quiz" do
    patch :update, id: @user_quiz, user_quiz: { quiz_id: @user_quiz.quiz_id, relationship: @user_quiz.relationship, user_id: @user_quiz.user_id }
    assert_redirected_to user_quiz_path(assigns(:user_quiz))
  end

  test "should destroy user_quiz" do
    assert_difference('UserQuiz.count', -1) do
      delete :destroy, id: @user_quiz
    end

    assert_redirected_to user_quizzes_path
  end
end
