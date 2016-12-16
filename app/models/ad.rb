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

  def user_kind
    ##Search user account kind.
    @kind_user = self.user.account.account_kind
  end

  def Adnumber
    #Find the AdNumber Resource . ID: 3 and account kind.
    @Adnumber = AccountResource.find_by_resource_id_and_account_kind_id(3, user_kind)
  end
end
