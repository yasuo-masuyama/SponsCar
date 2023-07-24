class CreateTransferInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :transfer_infos do |t|
      t.references :driver, null:false, foreign_key: true
      t.string :bank_name, null:false
      t.string :branch_name, null:false
      t.integer :account_number, null:false
      t.integer :account_type, null:false
      t.string :account_name, null:false

      t.timestamps
    end
  end
end
