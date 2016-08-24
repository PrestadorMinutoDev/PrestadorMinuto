class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :mobile
      t.string :doc
      t.date :birthdate
      t.string :email
      t.date :last_logon
      t.date :certdate

      t.timestamps null: false
    end
  end
end
