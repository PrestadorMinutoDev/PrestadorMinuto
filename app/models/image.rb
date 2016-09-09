class Image < ActiveRecord::Base
  has_many :users
  has_many :ad_images


  ##validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
