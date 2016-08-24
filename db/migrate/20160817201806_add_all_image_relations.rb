class AddAllImageRelations < ActiveRecord::Migration
  def change
    ##Foreign_Key image_id na tabela AD_IMAGES.
    add_reference :ad_images, :image, index: true,foreign_key: true

  end
end
