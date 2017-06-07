module CustomItemsHelper
  def render_custom_item_formula(custom_item)
    case custom_item.fitting.category
    when '布料'
      case custom_item.fitting.spec
      when '定高'
        '窗宽 × 2'
      when '定宽1.4m', '定宽2.8m'
        "窗高 × 幅数 \n (幅数 = 窗宽 × 2 ÷ 幅宽，进一法)"
      end
    when '罗马杆'
      '窗宽 + 0.4'
    # else
    #   '无'
    end
  end
end
