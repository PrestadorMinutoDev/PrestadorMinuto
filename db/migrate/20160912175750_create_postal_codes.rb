class CreatePostalCodes < ActiveRecord::Migration
  def change
    create_table :postal_codes do |t|
      t.integer :zip_number

      t.timestamps null: false
    end
  end
end
