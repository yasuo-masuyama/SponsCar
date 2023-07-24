class CreateCarInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :car_infos do |t|
      t.references :driver, null:false, foreign_key: true
      t.string :manufacturer_name, null:false
      t.string :name, null:false
      t.string :flame_number, null:false
      t.string :license_plate, null:false
      t.text :vehicle_image, null:false

      t.timestamps
    end
  end
end
