class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :driver, null:false, foreign_key: true
      t.references :advertisement, null:false, foreign_key: true

      t.timestamps
    end
  end
end
