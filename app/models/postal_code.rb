class PostalCode < ActiveRecord::Base
  has_many :addresses
  validates :zip_number, uniqueness: true, numericality: { only_integer: true }


end
