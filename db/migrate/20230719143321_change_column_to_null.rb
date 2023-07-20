class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :drivers, :profile_image, true
  end
end
