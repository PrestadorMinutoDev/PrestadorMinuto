class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :complement
      t.integer :number
      t.string :geolocation, null:true

      t.timestamps null: false
    end
  end
end
