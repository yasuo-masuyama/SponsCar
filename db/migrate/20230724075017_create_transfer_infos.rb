class CreateTransferInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :transfer_infos do |t|

      t.timestamps
    end
  end
end
