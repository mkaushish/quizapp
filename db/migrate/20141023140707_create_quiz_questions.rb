class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.integer :quiz_id
      t.integer :question_id
      t.integer :serial_no

      t.timestamps
    end
    add_column :quiz_questions, :deleted_at, :datetime
    add_index :quiz_questions, :deleted_at
  end
end
