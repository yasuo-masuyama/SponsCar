class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.string :title, null:false
      t.text :content, null:false
      t.integer :viewer_type, null:false, default: 0
      
      t.timestamps
    end
  end
end
