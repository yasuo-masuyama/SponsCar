class CreateAdvertisements < ActiveRecord::Migration[6.1]
  def change
    create_table :advertisements do |t|
      t.bigint :sponsor_id, null: false
      t.bigint :genre_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :heading, null: false
      t.text :image
      t.integer :amounts, null:false
      t.boolean :is_active, null: false, default: true
      t.date :start_due_on, null: false
      t.date :end_due_on, null: false

      t.timestamps
    end
  end
end
