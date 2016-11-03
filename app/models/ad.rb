class Ad < ActiveRecord::Base
  belongs_to :profession
  belongs_to :user

  has_many :rates
  has_many :images, :dependent => :destroy

  accepts_nested_attributes_for :profession
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :images

  attr_accessor :search

  def self.search(search)
    prof = Profession.find_by(name_m: search)
    if prof.nil?
      Ad.all
    else
      key = "%#{search}%"
      Ad.where("profession_id LIKE #{prof.id} OR profession_id_1 LIKE #{prof.id}", search: key)
    end
  end
end
