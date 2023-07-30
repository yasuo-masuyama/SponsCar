class CreateRelationshipDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :relationship_drivers do |t|

      t.timestamps
    end
  end
end
