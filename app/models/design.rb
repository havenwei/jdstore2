class Design < ApplicationRecord
  has_many :design_lists, dependent: :destroy
  belongs_to :user

  def total_price
    sum = 0
    design_lists.each do |design_list|
      if design_list.size.present?
        sum += design_list.subtotal
      end
    end
    sum
  end
end
