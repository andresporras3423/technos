class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :word
      t.boolean :translation

      t.timestamps
    end
  end
end
