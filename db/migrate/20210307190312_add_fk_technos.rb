class AddFkTechnos < ActiveRecord::Migration[6.1]
  def change
    add_column :technos, :user_id, :integer
    add_foreign_key :technos, :users
  end
end
