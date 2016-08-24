class AddAllUserRelations < ActiveRecord::Migration
  def change

    ##Adiciona uma coluna "mobile" na tabela users com id da tabela user_phones
    add_foreign_key :users, :user_phones, column: :mobile, primary_key: "id", presence: false

    ##Foreign_Key address_id na tabela USERS.
    add_reference :users, :address, index: true,foreign_key: true

    ##Foreign_Key image_id na tabela USERS.
    add_reference :users, :image, index: true,foreign_key: true


  end
end
