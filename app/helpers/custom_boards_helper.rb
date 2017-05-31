module CustomBoardsHelper
  def render_custom_item_subtotal(custom_item)
    custom_item.subtotal
  end

  def render_custom_total_price(custom_board)
    # sum = 0
    # custom_board.custom_items.each do |custom_item|
    #   sum += custom_item.subtotal
    # end
    # sum
    custom_board.total_price
  end
end
