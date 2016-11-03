class Phone < ActiveRecord::Base
  belongs_to :operator
  validates :number, uniqueness: true
  validates_presence_of :number

  validates :number,:presence => true,:numericality => true,:length => { :minimum => 10, :maximum => 15 }
  
  has_many :user_phones


  def check_my_number
    unless Phone.find_by(number: self.number).nil?
      self.id = Phone.find_by(number: self.number).id
    end
  end

end
