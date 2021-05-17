class UniqUserTechno < ActiveRecord::Migration[6.1]
  def change
    add_index :technos, [:user_id, :techno_name], unique: true
  end
end
