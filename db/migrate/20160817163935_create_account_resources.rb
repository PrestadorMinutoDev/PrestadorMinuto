class CreateAccountResources < ActiveRecord::Migration
  def change
    create_table :account_resources do |t|
      t.string :parameter

      t.timestamps null: false
    end
  end
end
