class RemoveLicenseImageFromDrivers < ActiveRecord::Migration[6.1]
  def change
    remove_column :drivers, :license_image, :text
  end
end
