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

  before_validation 'check_city','check_zip_number','check_street'

  def check_city
    unless City.find_by(name: self.city.name).nil?
      self.city = City.find_by(name: self.city.name)
    end
  end

  def check_zip_number
    unless PostalCode.find_by(zip_number: self.postal_code.zip_number).nil?
      self.postal_code = PostalCode.find_by(zip_number: self.postal_code.zip_number)
    end
  end

  def check_street
    unless Street.find_by(name: self.street.name).nil?
      self.street = Street.find_by(name: self.street.name)
    end
  end

end