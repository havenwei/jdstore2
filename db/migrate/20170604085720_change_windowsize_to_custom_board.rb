class ChangeWindowsizeToCustomBoard < ActiveRecord::Migration[5.0]
  def change
    change_column :custom_boards, :window_height, :float, default: 0
    change_column :custom_boards, :window_width, :float, default: 0
  end
end
