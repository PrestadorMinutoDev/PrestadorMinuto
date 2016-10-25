class AddAllImagesRelations < ActiveRecord::Migration
  def change
    ##Foreign_Key PostalCode_id na tabela ADDRESS.
    add_reference :images, :ad, index: true, foreign_key: true, null: false
  end
end
