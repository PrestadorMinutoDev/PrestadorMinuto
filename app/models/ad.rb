class Ad < ActiveRecord::Base
  belongs_to :profession

  has_many :rates
  has_many :ad_images
  has_one :profession
end
