class AccountResource < ActiveRecord::Base
  belongs_to :account_kind
  belongs_to :resource
end
