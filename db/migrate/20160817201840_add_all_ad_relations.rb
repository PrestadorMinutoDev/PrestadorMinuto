class AddAllAdRelations < ActiveRecord::Migration
  def change

    ##Foreign_Key profession_id na tabela AD.
    add_reference :ads, :profession, index: true,foreign_key: true

    ##Foreign_Key profession_id2 na tabela AD do id de PROFESSION.
    add_foreign_key :ads, :professions, column: :profession_id_1, primary_key: "id"

    ##Foreign_Key ad_id na tabela AD_IMAGE
    add_reference :ad_images, :ad, index: true,foreign_key: true



  end
end
