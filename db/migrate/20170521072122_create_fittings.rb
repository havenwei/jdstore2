class CreateFittings < ActiveRecord::Migration[5.0]
  def change
    create_table :fittings do |t|
      t.string :title
      t.string :pid
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
