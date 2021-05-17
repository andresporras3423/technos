class UniqUserWord < ActiveRecord::Migration[6.1]
  def change
    add_index :words, [:user_id, :word, :techno_id], unique: true
  end
end
