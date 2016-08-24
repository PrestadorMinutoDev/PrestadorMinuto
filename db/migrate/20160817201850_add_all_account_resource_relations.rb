class AddAllAccountResourceRelations < ActiveRecord::Migration
  def change
    ##Foreign_Key account_kind_id na tabela ACCOUNT_RESOURCE.
    add_reference :account_resources, :account_kind, index: true,foreign_key: true

    ##Foreign_Key resource_id na tabela ACCOUNT_RESOURCE.
    add_reference :account_resources, :resource, index: true,foreign_key: true
  end
end
