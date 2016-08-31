class Phone < ActiveRecord::Base
  belongs_to :operator
  validates :number, uniqueness: true, on: :create

  has_many :user_phones


end
