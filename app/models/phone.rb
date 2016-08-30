class Phone < ActiveRecord::Base
  belongs_to :operator
   validates :number, uniqueness: true, on: :create

  has_one :operator
  has_many :user_phones, through: :users
end
