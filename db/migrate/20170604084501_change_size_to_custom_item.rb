class ChangeSizeToCustomItem < ActiveRecord::Migration[5.0]
  def change
    change_column :custom_items, :size, :float, default: 0
  end
end
