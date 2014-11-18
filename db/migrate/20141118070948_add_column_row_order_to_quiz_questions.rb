class AddColumnRowOrderToQuizQuestions < ActiveRecord::Migration
  def change
  	add_column :quiz_questions, :row_order, :integer
  end
end
