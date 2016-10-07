class Ad < ActiveRecord::Base
  belongs_to :profession
  belongs_to :user

  has_many :rates
  has_many :ad_images
  has_many :images,:through => :ad_images

  accepts_nested_attributes_for :profession
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :images
end
