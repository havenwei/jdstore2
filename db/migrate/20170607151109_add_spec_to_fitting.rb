class AddSpecToFitting < ActiveRecord::Migration[5.0]
  def change
    add_column :fittings, :spec, :string, default: 'none' 
  end
end
