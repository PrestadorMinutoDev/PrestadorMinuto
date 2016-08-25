class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.decimal :punctuality,precision:3, scale:2
      t.decimal :quality,precision:3, scale:2
      t.decimal :presentation,precision:3, scale:2
      t.string :comments

      t.timestamps null: false
    end
  end
end
