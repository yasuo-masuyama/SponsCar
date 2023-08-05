class ChangeDriverIdToReferencesInUnderDeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :under_deals, :driver_id, :bigint
    add_reference :under_deals, :driver, null: false, foreign_key: true
  end
end
