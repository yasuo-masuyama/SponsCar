class CreateDealDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :deal_details do |t|
      t.references :under_deal, null:false, foreign_key: true
      t.integer "payment_amount"
      t.integer "transfer_status", default: 0, null: false
      t.string "bank_name", null: false
      t.string "branch_name", null: false
      t.integer "account_type", null: false
      t.integer "account_number", null: false
      t.string "account_name", null: false

      t.timestamps
    end
  end
end
