class User < ActiveRecord::Base

  belongs_to :address

  #has_many :accounts
  has_many :user_phones
  has_many :phones,:through => :user_phones



  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :address

  validates :pwd, confirmation: true
  validates_presence_of :doc,:email,:name,:pwd

  before_save 'encrypt_my_data','hash_my_pass'



  def encrypt_my_data
    tmpcryp = Decrypter.new
    if doc.present?
      self.slt = tmpcryp.get_cipher_salt
      self.doc = tmpcryp.encrypt self.doc, self.slt
    end
  end

  def hash_my_pass
    tmpcryp = Decrypter.new
    if pwd.present?
      self.pwd = tmpcryp.creatHash self.pwd
    end
  end


end
