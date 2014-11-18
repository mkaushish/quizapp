class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.integer :response_id
      t.integer :points
      t.integer :answer_id
      t.boolean :correct
      t.boolean :checked
      t.text :description

      t.timestamps
    end
  end
end
