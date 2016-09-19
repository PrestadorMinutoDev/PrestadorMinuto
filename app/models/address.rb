class Address < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :country
  belongs_to :postal_code
  belongs_to :street

  accepts_nested_attributes_for :postal_code
  accepts_nested_attributes_for :street
  accepts_nested_attributes_for :city
  accepts_nested_attributes_for :state

  has_many :users

  def check_my_city
    unless City.find_by(name: self.city.name).nil?
      self.city = City.find_by(name: self.city.name)
    end
  end

  def check_my_state
    unless State.find_by(name: self.state.name).nil?
      self.state = City.find_by(name: self.state.name)
    end
  end

  def check_my_street
    unless Street.find_by(name: self.street.name).nil?
      self.street = Street.find_by(name: self.street.name)
    end
  end

  def check_my_postal_code
    unless PostalCode.find_by(number: self.postal_code.number).nil?
      self.postal_code = PostalCode.find_by(number: self.postal_code.number)
    end
  end
end
