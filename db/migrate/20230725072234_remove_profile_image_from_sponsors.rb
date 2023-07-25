class RemoveProfileImageFromSponsors < ActiveRecord::Migration[6.1]
  def change
    remove_column :sponsors, :profile_image, :text
  end
end
