class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :country

  has_one :city
  has_one :state
  has_one :country
end
