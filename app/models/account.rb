class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :account_kind

  has_one :account_kind
  has_one :user
end
