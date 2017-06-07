class AddTitleToDesign < ActiveRecord::Migration[5.0]
  def change
    add_column :designs, :title, :string
  end
end
