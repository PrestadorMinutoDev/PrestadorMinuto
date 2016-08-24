class CreateAccountKinds < ActiveRecord::Migration
  def change
    create_table :account_kinds do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
