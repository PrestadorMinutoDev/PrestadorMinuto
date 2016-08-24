class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :zip
      t.string :address1
      t.string :address2
      t.string :address3

      t.timestamps null: false
    end
  end
end
