class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.decimal :punctuality
      t.decimal :quality
      t.decimal :presentation
      t.string :comments

      t.timestamps null: false
    end
  end
end
