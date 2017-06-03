class AddMoreDetailToCustomBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :custom_boards, :useto, :string
    add_column :custom_boards, :window_height, :integer
    add_column :custom_boards, :window_width, :integer
  end
end
