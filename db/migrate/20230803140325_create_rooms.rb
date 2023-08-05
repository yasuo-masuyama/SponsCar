class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :driver, null:false, foreign_key: true
      t.references :sponsor, null:false, foreign_key: true
      t.references :advertisement, null:false, foreign_key: true

      t.timestamps
    end
  end
end
