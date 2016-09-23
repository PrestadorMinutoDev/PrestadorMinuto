class Phone < ActiveRecord::Base
  belongs_to :operator
  validates :number, uniqueness: true

  has_many :user_phones


end
