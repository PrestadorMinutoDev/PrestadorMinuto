class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :postal_code
  belongs_to :street

  accepts_nested_attributes_for :postal_code
  accepts_nested_attributes_for :street
  accepts_nested_attributes_for :city

  has_many :users


end
