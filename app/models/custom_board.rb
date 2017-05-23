class CustomBoard < ApplicationRecord
  has_many :custom_items
  has_many :fittings, through: :custom_items, source: :fitting

  def add_fitting_to_custom_board(fitting)
    ci = custom_items.build
    ci.fitting = fitting
    ci.size = 1
    ci.save
  end

  def total_price
    sum = 0
    custom_items.each do |custom_item|
      if custom_item.size.present?
        sum += custom_item.subtotal
      end
    end
    sum
  end

  def clean!
    custom_items.destroy_all
  end
end
