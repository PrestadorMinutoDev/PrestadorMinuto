class User < ActiveRecord::Base

  ## Só é utilizado belongs_to quando a classe tem foreign_key
  belongs_to :address

  has_many :ads
  has_one :account
  has_many :user_phones
  has_many :phones,:through => :user_phones



  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :address




  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  #validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  #validates :doc, :presence => true, :uniqueness => true, :length => 11
  validates :pwd, confirmation: true

  validates_presence_of :name,:pwd
  before_validation 'check_my_stuff'
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

  def check_my_stuff

      self.address.city = City.find_or_create_by(name: self.address.city.name)
      self.address.street = Street.find_or_create_by(name: self.address.street.name)
      self.address.postal_code = PostalCode.find_or_create_by(zip_number: self.address.postal_code.zip_number)
      if self.phones.length > 0
        puts "oi"
        if self.phones.uniq.length == self.phones.length
          #self.user_phones.destroy_all
          myp = Array.new
          self.phones.each do |p|
            tmp = Phone.find_by(number: p.number)
            puts 'my_id:'
            puts p.id
            if tmp.nil?
              myp << p
            else
              myp << tmp
            end
          end
          self.phones = myp
        else
          errors.add :phones, 'Duplicated phones found'
        end
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