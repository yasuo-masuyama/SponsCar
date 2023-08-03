class RemoveInstallationImageFromUnderDeals < ActiveRecord::Migration[6.1]
  def change
    remove_column :under_deals, :installation_image, :text
  end
end
