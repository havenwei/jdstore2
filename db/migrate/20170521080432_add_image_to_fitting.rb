class AddImageToFitting < ActiveRecord::Migration[5.0]
  def change
    add_column :fittings, :image, :string
  end
end
