class RemoveRegistryImageFromSponsors < ActiveRecord::Migration[6.1]
  def change
    remove_column :sponsors, :registry_image, :text
  end
end
