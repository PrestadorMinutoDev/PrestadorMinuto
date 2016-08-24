class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name_m
      t.string :name_f

      t.timestamps null: false
    end
  end
end
