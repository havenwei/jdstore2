class DesignList < ApplicationRecord
  belongs_to :design
  belongs_to :fitting

  def subtotal
    subtotal = 0
    if fitting.present? and fitting.price.presence
      subtotal = (fitting.price * itself.size).round
    end
    subtotal
  end
end
