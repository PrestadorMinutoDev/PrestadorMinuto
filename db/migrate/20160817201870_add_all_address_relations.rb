class AddAllAddressRelations < ActiveRecord::Migration
  def change
    ##Foreign_Key image_id na tabela AD_IMAGES.
    add_reference :addresses, :city, index: true,foreign_key: true
    ##Foreign_Key image_id na tabela AD_IMAGES.
    add_reference :addresses, :state, index: true,foreign_key: true
    ##Foreign_Key image_id na tabela AD_IMAGES.
    add_reference :addresses, :country, index: true,foreign_key: true
  end
end
