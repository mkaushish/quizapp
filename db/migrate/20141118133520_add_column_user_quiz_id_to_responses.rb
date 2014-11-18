class AddColumnUserQuizIdToResponses < ActiveRecord::Migration
  def change
  	add_column :responses, :user_quiz_id, :integer
  	add_column :responses, :row_order, :integer
  	add_column :user_quizzes, :question_id, :integer
  end
end
