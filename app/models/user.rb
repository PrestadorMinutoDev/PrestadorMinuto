class User < ActiveRecord::Base

  belongs_to :address

  #has_many :accounts
  has_many :user_phones
  has_many :phones,:through => :user_phones



  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :address


  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  #validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  #validates :doc, :presence => true, :uniqueness => true, :length => 11
  validates :pwd, confirmation: true
  validates_presence_of :name,:pwd
  before_save 'encrypt_my_data','hash_my_pass'
  after_find  'decrypt_my_data'



  def encrypt_my_data
    tmpcryp = Decrypter.new
    if doc.present?
      self.slt = tmpcryp.get_cipher_salt
      self.doc = tmpcryp.encrypt self.doc, self.slt
    end
  end

  def decrypt_my_data
    tmpcryp = Decrypter.new
    if doc.present?
      self.doc = tmpcryp.decrypt self.doc, self.slt
    end
  end


  def hash_my_pass
    tmpcryp = Decrypter.new
    if pwd.present?
      self.pwd = tmpcryp.creatHash self.pwd
    end
  end


  has_attached_file :avatar, styles: { original: "128x128>" },
                    default_url: "/assets/nobody_default.jpg",
                    path: "#{Rails.root}/public/assets/:id/:style/:basename.:extension",
                    url: '/assets/:id/:style/:basename.:extension'
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
