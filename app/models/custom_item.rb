class CustomItem < ApplicationRecord
  belongs_to :custom_board
  belongs_to :fitting

  def subtotal
    subtotal = fitting.price * itself.size
  end
end
