class CreateAccountResourceValue < ActiveRecord::Migration
  def change
    create_table :account_resource_values do |t|
      t.string :value
    end
  end
end
