class PostalCode < ActiveRecord::Base
  has_many :addresses
  validates :zip_number, uniqueness: true, on: :create

  before_validation 'check_zip_number'

  def check_zip_number
    unless PostalCode.find_by(zip_number: self.zip_number).nil?
      self.id = PostalCode.find_by(zip_number: self.zip_number).id
    end
  end

end
