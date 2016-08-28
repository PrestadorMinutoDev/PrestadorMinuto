class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,limit:175
      t.integer :mobile
      t.string :doc,limit:75
      t.date :birthdate
      t.string :email,limit:175
      t.date :last_logon
      t.date :certdate
      t.string :pwd,limit:175
      t.binary :slt


      t.timestamps null: false
    end
  end
end
