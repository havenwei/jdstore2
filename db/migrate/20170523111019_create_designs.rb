class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.integer :total, default: 0
      t.integer :user_id
      t.integer :window_height
      t.integer :window_width
      t.timestamps
    end
  end
end
