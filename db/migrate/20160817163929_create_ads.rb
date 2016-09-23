class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.text :description
      t.decimal :rating_avg, precision:3, scale:2

      t.timestamps null: false
    end
  end
end
