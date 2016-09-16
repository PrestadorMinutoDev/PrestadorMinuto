class PostalCode < ActiveRecord::Base
  has_many :addresses
end
