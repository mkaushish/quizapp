class CreateUserQuestions < ActiveRecord::Migration
  def change
    create_table :user_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :relationship

      t.timestamps
    end
    add_column :user_questions, :deleted_at, :datetime
    add_index :user_questions, :deleted_at
  end
end
