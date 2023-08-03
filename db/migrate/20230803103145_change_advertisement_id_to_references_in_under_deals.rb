class ChangeAdvertisementIdToReferencesInUnderDeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :under_deals, :advertisement_id, :bigint
    add_reference :under_deals, :advertisement, null: false, foreign_key: true
  end
end
