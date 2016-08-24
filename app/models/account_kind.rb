class AccountKind < ActiveRecord::Base
  has_many :accounts
  has_many :account_resources
end
