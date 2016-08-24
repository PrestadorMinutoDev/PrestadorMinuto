class AddAllUserPhonesRelations < ActiveRecord::Migration
  def change

    ##Foreign_Key phone_id na tabela USER_PHONES.
    add_reference :user_phones, :phone, index: true,foreign_key: true

    ##Foreign_Key user_id na tabela USER_PHONES.
    add_reference :user_phones,:user,index: true,foreign_key:true

  end
end
