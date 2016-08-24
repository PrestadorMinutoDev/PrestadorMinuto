class User < ActiveRecord::Base
  has_many :rates
  has_many :accounts
  has_many :user_phones
  has_one :address
end
