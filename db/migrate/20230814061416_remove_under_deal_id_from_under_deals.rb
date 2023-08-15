class RemoveUnderDealIdFromUnderDeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :under_deals, :under_deal_id, :bigint
  end
end
