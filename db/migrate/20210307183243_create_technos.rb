class CreateTechnos < ActiveRecord::Migration[6.1]
  def change
    create_table :technos do |t|
      t.string :techno_name
      t.boolean :techno_status

      t.timestamps
    end
  end
end
