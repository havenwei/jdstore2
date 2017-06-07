class CustomItem < ApplicationRecord
  belongs_to :custom_board
  belongs_to :fitting

  def subtotal
    subtotal = 0
    if fitting.present? and fitting.price.presence
      subtotal = (fitting.price * itself.size).round(1)
    end
    subtotal
  end

  def calculator(category)
    case category
    when '布料'
      self.size = self.custom_board.window_width * 2
    when '罗马杆'
      self.size = self.custom_board.window_width + 0.4
    end

    self.size = (self.size*10).ceil/10.0
  end
end
