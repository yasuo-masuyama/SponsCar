class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name, null:false
      t.boolean :flag_active, default: true

      t.timestamps
    end
  end
end
