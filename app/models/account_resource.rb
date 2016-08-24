class AccountResource < ActiveRecord::Base
  belongs_to :account_kind
  belongs_to :resources

  has_one :resource
end
