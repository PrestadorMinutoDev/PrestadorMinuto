class AdImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :ad

  has_one :image
  has_one :ad
end
