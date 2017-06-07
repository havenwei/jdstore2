class AddCategoryToFitting < ActiveRecord::Migration[5.0]
  def change
    add_column :fittings, :category, :string
  end
end
