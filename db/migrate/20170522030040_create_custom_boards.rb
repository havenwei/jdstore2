class CreateCustomBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_boards do |t|
      
      t.timestamps
    end
  end
end
