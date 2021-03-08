class RemoveRememberToken < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :remember_token
  end
end
