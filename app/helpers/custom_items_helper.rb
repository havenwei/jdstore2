module CustomItemsHelper
  def render_custom_item_formula(custom_item)
    case custom_item.fitting.category
    when '布料'
      '窗宽 × 2'
    when '罗马杆'
      '窗宽 + 0.4'
    else
      '无'
    end
  end
end
