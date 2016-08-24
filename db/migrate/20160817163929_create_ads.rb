class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.text :description
      t.decimal :rating_avg
      t.string :adscol
      t.integer :profession_id_1
      t.integer :profession_id_2

      t.timestamps null: false
    end
  end
end
