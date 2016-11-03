class AddAllAdRelations < ActiveRecord::Migration
  def change


    ##Foreign_Key profession_id na tabela AD.
    add_reference :ads, :profession, index: true,foreign_key: true


    add_column :ads, :profession_id_1, :integer, index: true, foreign_key: true
    add_foreign_key :ads, :professions, column: :profession_id_1, integer: "profession_id_1", presence: false

    ##Foreign_Key profession_id2 na tabela AD do id de PROFESSION.
    #add_reference :ads ,:profession, column: :profession_id_1, presence: false



    ##Foreign_Key user_id na tabela ADS.
    add_reference :ads, :user, index: true,foreign_key: true


  end
end
