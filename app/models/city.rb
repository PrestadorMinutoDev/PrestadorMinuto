class City < ActiveRecord::Base
  has_many :addresses
  validates :name, uniqueness: true


end
