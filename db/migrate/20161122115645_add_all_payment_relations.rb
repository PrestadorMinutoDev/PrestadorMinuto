class AddAllPaymentRelations < ActiveRecord::Migration
  def change
    ##Foreign_Key User_id na tabela ADDRESS.
    add_reference :payments,:user,index: true,foreign_key:true, null: false
  end
end
