class Payment < ActiveRecord::Base
  validates :name, :presence => true
  validates :amount, :presence => true
  validates :cardNumber, :presence => true
  validates :monthCard, :presence => true
  validates :yearCard, :presence => true
  validates :securityCode, :presence => true
  validates :holder, :presence => true
  validates :brand, :presence => true
end