class AddAllAddressRelations < ActiveRecord::Migration
  def change
    ##Foreign_Key city_id na tabela ADDRESS.
    add_reference :addresses, :city, index: true,foreign_key: true
    ##Foreign_Key state_id na tabela ADDRESS.
    add_reference :addresses, :state, index: true,foreign_key: true
    ##Foreign_Key country_id na tabela ADDRESS.
    add_reference :addresses, :country, index: true,foreign_key: true
    ##Foreign_Key street_id na tabela ADDRESS.
    add_reference :addresses, :street, index: true, foreign_key: true
    ##Foreign_Key PostalCode_id na tabela ADDRESS.
    add_reference :addresses, :postal_code, index: true, foreign_key: true
  end
end
