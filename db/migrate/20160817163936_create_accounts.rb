class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.column :account_status,"char(1)", default: 'W'

      t.timestamps null: false
    end
  end
end
