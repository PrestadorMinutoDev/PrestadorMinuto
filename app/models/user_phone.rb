class UserPhone < ActiveRecord::Base
  belongs_to :phone
  belongs_to :user

  has_one :phone
  has_one :user
end
