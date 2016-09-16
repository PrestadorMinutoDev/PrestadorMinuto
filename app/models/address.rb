class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :postal_code #:autosave => true
  belongs_to :street #:autosave => true

  accepts_nested_attributes_for :postal_code, update_only: true
  accepts_nested_attributes_for :street, update_only: true

  has_many :users


end
