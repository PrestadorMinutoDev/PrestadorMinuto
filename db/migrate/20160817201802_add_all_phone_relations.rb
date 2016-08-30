class AddAllPhoneRelations < ActiveRecord::Migration
  def change
    add_reference :phones, :operator, index: true,foreign_key: true, presence: true, default: 1
  end
end
