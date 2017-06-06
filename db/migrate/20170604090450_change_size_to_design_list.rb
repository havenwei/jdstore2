class ChangeSizeToDesignList < ActiveRecord::Migration[5.0]
  def change
    change_column :design_lists, :size, :float, default: 0
  end
end
