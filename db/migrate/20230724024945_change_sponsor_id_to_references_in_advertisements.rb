class ChangeSponsorIdToReferencesInAdvertisements < ActiveRecord::Migration[6.1]
  def change
    remove_column :advertisements, :sponsor_id, :bigint
    add_reference :advertisements, :sponsor, null: false, foreign_key: true
  end
end
