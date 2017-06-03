class DesignList < ApplicationRecord
  belongs_to :design
  belongs_to :fitting

  def subtotal
    subtotal = fitting.price * itself.size
  end
end
