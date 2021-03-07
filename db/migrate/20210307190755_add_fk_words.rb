class AddFkWords < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :user_id, :integer
    add_column :words, :techno_id, :integer
    add_foreign_key :words, :users
    add_foreign_key :words, :technos
  end
end
