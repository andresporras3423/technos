class AddFkTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :user_id, :integer
    add_foreign_key :tests, :users
  end
end
