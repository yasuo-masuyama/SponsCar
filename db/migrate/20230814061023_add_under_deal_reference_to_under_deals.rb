class AddUnderDealReferenceToUnderDeals < ActiveRecord::Migration[6.1]
  def change
    add_reference :under_deals, :under_deal, null: false, foreign_key: true
  end
end
