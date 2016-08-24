class Image < ActiveRecord::Base
  has_many :users
  has_many :ad_images
end
