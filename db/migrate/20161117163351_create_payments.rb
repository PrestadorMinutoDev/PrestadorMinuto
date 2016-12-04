class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|

      #CardNumber and SecurityCode is need string for encrypt on db.
      t.timestamps null: false
      t.string :paymentId
      t.string :name
      t.integer  :amount
      t.string :cardNumber
      t.integer :monthCard
      t.integer :yearCard
      t.string :holder
      t.string :brand
      t.string :recurrentPayment
      t.string :endDate
    end
  end
end