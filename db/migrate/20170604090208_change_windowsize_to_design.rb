class ChangeWindowsizeToDesign < ActiveRecord::Migration[5.0]
  def change
    change_column :designs, :window_height, :float, default: 0
    change_column :designs, :window_width, :float, default: 0
  end
end
