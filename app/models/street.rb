class Street < ActiveRecord::Base
  has_many :addresses
  validates :name, uniqueness: true, on: :create
end
