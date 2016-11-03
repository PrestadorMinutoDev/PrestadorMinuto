class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name_m,limit:75
      t.string :name_f,limit:75
      t.integer :profession_id_1

      t.timestamps null: false
    end
  end
end
