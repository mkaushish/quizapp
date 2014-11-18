Rails.application.routes.draw do
  resources :user_quizzes

  resources :user_questions

  resources :quizzes

  resources :user_answers

  resources :responses

  resources :answers

  resources :questions
  
  resources :quiz_questions do
    post :update_row_order, on: :collection
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
