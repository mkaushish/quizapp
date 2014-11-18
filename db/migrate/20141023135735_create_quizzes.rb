class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      

      t.timestamps
    end
    add_column :quizzes, :deleted_at, :datetime
    add_index :quizzes, :deleted_at
  end
end
