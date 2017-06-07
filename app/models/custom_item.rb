class CustomItem < ApplicationRecord
  belongs_to :custom_board
  belongs_to :fitting

  def subtotal
    subtotal = 0
    if fitting.present? and fitting.price.presence
      subtotal = (fitting.price * itself.size).round
    end
    subtotal
  end

  def calculator(category)
    case category
    when '布料'
      # 方案1
      # if fitting.spec == '定高'
      #   self.size = self.custom_board.window_width * 2
      # elsif fitting.spec == '定宽1.4m'
      #   self.size = (self.custom_board.window_width * 2 / 1.4).ceil * self.custom_board.window_height
      # elsif fitting.spec == '定宽2.8m'
      #   self.size = (self.custom_board.window_width * 2 / 2.8).ceil * self.custom_board.window_height
      # end

      # 方案2
      case fitting.spec
      when '定高'
        self.size = self.custom_board.window_width * 2
      when '定宽1.4m'
        self.size = (self.custom_board.window_width * 2 / 1.4).ceil * self.custom_board.window_height
      when '定宽2.8m'
        self.size = (self.custom_board.window_width * 2 / 2.8).ceil * self.custom_board.window_height
      end

    when '罗马杆'
      self.size = self.custom_board.window_width + 0.4
    end

    self.size = (self.size*10).ceil/10.0
  end
end
