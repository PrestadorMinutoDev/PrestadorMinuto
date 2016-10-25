class AddAttachmentPicturesToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :pictures
    end
  end

  def self.down
    remove_attachment :images, :pictures
  end
end
