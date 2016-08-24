class CreateUserPhones < ActiveRecord::Migration
  def change
    create_table :user_phones do |t|

      t.timestamps null: false
    end
  end
end
