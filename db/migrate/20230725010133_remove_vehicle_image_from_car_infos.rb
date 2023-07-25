class RemoveVehicleImageFromCarInfos < ActiveRecord::Migration[6.1]
  def change
    remove_column :car_infos, :vehicle_image, :text
  end
end
