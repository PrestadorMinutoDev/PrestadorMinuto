class AddAllAccountResourceValueRelations < ActiveRecord::Migration
  def change
    ##Foreign_Key account_id na tabela ACCOUNT_RESOURCE_VALUES.
    add_reference :account_resource_values, :account, index: true,foreign_key: true

    ##Foreign_Key account_resource_id na tabela ACCOUNT_RESOURCE_VALUES.
    add_reference :account_resource_values, :account_resource, index: true,foreign_key: true

  end
end
