class ChangeGenreIdToReferencesInAdvertisements < ActiveRecord::Migration[6.1]
  def change
    remove_column :advertisements, :genre_id, :bigint
    add_reference :advertisements, :genre, null: false, foreign_key: true
  end
end
