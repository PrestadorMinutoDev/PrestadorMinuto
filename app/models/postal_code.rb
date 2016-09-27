class PostalCode < ActiveRecord::Base
  has_many :addresses
  validates :zip_number, uniqueness: true, on: :create


end
