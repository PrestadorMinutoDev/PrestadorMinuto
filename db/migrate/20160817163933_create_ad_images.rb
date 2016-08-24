class CreateAdImages < ActiveRecord::Migration
  def change
    create_table :ad_images do |t|

      t.timestamps null: false
    end
  end
end
