class CreateUnderDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :under_deals do |t|
      t.bigint :advertisement_id, null:false
      t.bigint :driver_id, null:false
      t.integer :work_status, null:false, default: 0
      t.text :installation_image

      t.timestamps
    end
  end
end
