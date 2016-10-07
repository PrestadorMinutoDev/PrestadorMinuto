class AdImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :ad
end
