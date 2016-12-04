class Payment < ActiveRecord::Base
  validates :name, :presence => true
  validates :cardNumber, :presence => true, length: { is: 16 }
  validates :monthCard, :presence => true, length: { is: 2 }
  validates :yearCard, :presence => true, length: { is: 4 }
  validates :securityCode, :presence => true, length: { is: 3 }
  validates :holder, :presence => true
  validates :brand, :presence => true

  belongs_to :user

  attr_accessor :securityCode, :timeAccount

  before_save 'card_encrypt'
  after_save 'approve_payment'

  def card_encrypt
    card = self.cardNumber.to_s[-4, 4]
    card_saving = card
    self.cardNumber = card_saving

  end

  def approve_payment
    self.user.account.account_kind = AccountKind.find(2)
  end

end