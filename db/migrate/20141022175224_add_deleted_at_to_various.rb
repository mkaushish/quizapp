class AddDeletedAtToVarious < ActiveRecord::Migration
  def change
  	add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
    add_column :questions, :deleted_at, :datetime
    add_index :questions, :deleted_at
    add_column :answers, :deleted_at, :datetime
    add_index :answers, :deleted_at
    add_column :user_answers, :deleted_at, :datetime
    add_index :user_answers, :deleted_at
    add_column :responses, :deleted_at, :datetime
    add_index :responses, :deleted_at
  end
end
