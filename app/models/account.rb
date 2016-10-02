class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :account_kind
  belongs_to :phone

  accepts_nested_attributes_for :account_kind
  accepts_nested_attributes_for :phone
end
