class CustomBoard < ApplicationRecord
  has_many :custom_items
  has_many :fittings, through: :custom_items, source: :fitting

  def add_fitting_to_custom_board(fitting)
    ci = custom_items.build
    ci.fitting = fitting
    ci.size = 1
    ci.save
  end
end
