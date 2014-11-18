class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :type
      t.boolean :grading
      t.boolean :survey

      t.timestamps
    end
  end
end
