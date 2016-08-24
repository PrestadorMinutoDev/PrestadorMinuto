class AddAllRateRelations < ActiveRecord::Migration
  def change

    ##Foreign_Key ad_id na tabela RATES
    add_reference :rates, :ad, index: true,foreign_key: true

    ##Foreign_Key user_id na tabela RATES
    add_reference :rates, :user, index: true,foreign_key: true
  end
end
