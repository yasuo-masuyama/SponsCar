class RemoveImageFromAdvertisements < ActiveRecord::Migration[6.1]
  def change
    remove_column :advertisements, :image, :text
  end
end
