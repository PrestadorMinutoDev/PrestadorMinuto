class Rate < ActiveRecord::Base
  has_one :ad
  has_one :user
end
