class User < ActiveRecord::Base

  belongs_to :address

  has_one :account
  has_many :user_phones
  has_many :phones,:through => :user_phones



  accepts_nested_attributes_for :phones
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :account


  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  #validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  #validates :doc, :presence => true, :uniqueness => true, :length => 11
  validates :pwd, confirmation: true
  validates_presence_of :name,:pwd
  before_validation 'check_phones'
  before_save 'encrypt_my_data','hash_my_pass', 'check_account'
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
      self.pwd = tmpcryp.create_hash self.pwd, self.slt
    end
  end

  def check_phones
    temp_phone = Array.new
    self.phones.each do |f|

      puts '###########################'
      puts f.id
      puts f.number
      if f.id.nil? #Se não tiver ID
        if (p = Phone.find_by(number: f.number)).nil? #SE Telefone não encontrado
          temp_phone << Phone.new(number: f.number) #Cria numero
        else
          temp_phone << p #Insiro o telefone encontrado
        end
      else
        if f.number != Phone.find(f.id).number #Se o Numero não bater com o ID
          if (p = Phone.find_by(number: f.number)).nil? #Telefone não encontrado
            temp_phone << Phone.new(number: f.number) #Cria Telefone
          else #Está tudo batendo
            temp_phone << p

          end
        else
          temp_phone << f
        end
      end
    end

    self.phones = temp_phone

  end

  ## METHOD DISCARD
  def authentic(login,pass)

    if login.include? "@"
      u = User.find_by_email(login)
    else
      p = Phone.find_by_number('#{login}')
      up = UserPhone.find_by_phone_id(p.id)
      uf = up.user
    end

    if u.nil? || uf.nil?
      redirect_to login_user_path
    else
      puts '#########################'
      tmp_cryp = Decrypter.new
      if self.pwd == tmp_cryp.create_hash(pass,u.slt)
        true
      else
        false
      end
    end




  end

  def check_account
    if self.account.nil?
      self.account = Account.new
      self.account.phone = self.phones.first
    end
  end

  has_attached_file :avatar, styles: { original: "128x128>", thumb: "50x50>"},
                    default_url: "/assets/nobody_default.jpg",
                    path: "#{Rails.root}/public/assets/users/:id/:style/:basename.:extension",
                    url: '/assets/users/:id/:style/:basename.:extension'
  validates_attachment_content_type :avatar,  size: { in: 0..30.kilobytes }, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end
