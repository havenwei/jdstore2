class CreateCustomItems < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_items do |t|
      t.integer  :custom_boards_id
      t.integer  :fitting_id
      t.integer  :size, default: 1
      t.timestamps
    end
  end
end
