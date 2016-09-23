class Street < ActiveRecord::Base
  has_many :addresses
  validates :name, uniqueness: true, on: :create

  before_validation 'check_my_street'

  def check_my_street
    unless Street.find_by(name: self.name).nil?
      self.id = Street.find_by(name: self.name).id
    end
  end
end
