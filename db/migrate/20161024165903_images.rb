class Images < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.timestamps null: false
    end
  end
end
