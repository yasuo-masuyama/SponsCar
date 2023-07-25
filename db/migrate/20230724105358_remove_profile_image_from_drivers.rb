class RemoveProfileImageFromDrivers < ActiveRecord::Migration[6.1]
  def change
    remove_column :drivers, :profile_image, :text
  end
end
