class CreateDealMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :deal_messages do |t|
      t.references :under_deal, null:false, foreign_key: true
      t.text :message, null:false
      t.integer :user_type, null:false

      t.timestamps
    end
  end
end
