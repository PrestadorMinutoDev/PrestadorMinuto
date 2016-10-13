class AddAllAdRelations < ActiveRecord::Migration
  def change


    ##Foreign_Key profession_id na tabela AD.
    add_reference :ads, :profession, index: true,foreign_key: true


    ##Foreign_Key profession_id2 na tabela AD do id de PROFESSION.
    #add_reference :ads, :profession, column: :profession_id_1, primary_key: "id", presence: false

    ##Foreign_Key ad_id na tabela AD_IMAGE
    add_reference :ad_images, :ad, index: true,foreign_key: true

    ##Foreign_Key user_id na tabela ADS.
    add_reference :ads, :user, index: true,foreign_key: true


  end
end
