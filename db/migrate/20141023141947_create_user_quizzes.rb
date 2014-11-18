class CreateUserQuizzes < ActiveRecord::Migration
  def change
    create_table :user_quizzes do |t|
      t.integer :user_id
      t.integer :quiz_id
      t.integer :relationship

      t.timestamps
    end
    add_column :user_quizzes, :deleted_at, :datetime
    add_index :user_quizzes, :deleted_at
    add_column :responses, :quiz_id, :integer
  end
end
