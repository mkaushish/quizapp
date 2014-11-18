class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description
      t.boolean :checked
      t.integer :points_c
      t.integer :points_w
      t.integer :question_id

      t.timestamps
    end
  end
end
