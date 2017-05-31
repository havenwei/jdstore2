class CreateDesignLists < ActiveRecord::Migration[5.0]
  def change
    create_table :design_lists do |t|
      t.integer :design_id
      t.string  :fitting_id
      t.integer :size
      t.timestamps
    end
  end
end
