class UpdateTranslation < ActiveRecord::Migration[6.1]
  def change
    change_column :words, :translation, :string
  end
end
