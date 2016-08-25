class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number,limit:11
      t.boolean :haswp,default:false

      t.timestamps null: false
    end
  end
end
