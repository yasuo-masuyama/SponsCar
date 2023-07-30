class CreateRelationshipDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :relationship_drivers do |t|
      t.integer :follower_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end
    add_index :relationship_drivers, :follower_id
    add_index :relationship_drivers, :followed_id
    add_index :relationship_drivers, [:follower_id, :followed_id], unique: true
  end
end
