class AddAllAccountRelations < ActiveRecord::Migration
  def change

    ##Foreign_Key user_id na tabela ACCOUNT.
    add_reference :accounts, :user, index: true,foreign_key: true

    ##Foreign_Key account_kind_id na tabela ACCOUNT.
    add_reference :accounts, :account_kind, index: true,foreign_key: true

  end
end
