class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.timestamps null: false
      t.string :name
      t.integer  :amount
      t.integer :cardNumber
      t.integer :monthCard
      t.integer :yearCard
      t.integer :securityCode
      t.string :holder
      t.string :brand
    end
  end
end