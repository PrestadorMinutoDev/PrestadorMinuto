class City < ActiveRecord::Base
  has_many :addresses
  validates :name, uniqueness: true

  before_validation 'check_city'

  def check_city
    unless City.find_by(name: self.name).nil?
      self.id = City.find_by(name: self.name).id
      puts self.name
      puts self.id
    end
  end

end
