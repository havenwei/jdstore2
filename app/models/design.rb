class Design < ApplicationRecord
  has_many :design_lists, dependent: :destroy
  belongs_to :user

  validates :window_width, presence: true
  validates :window_height, presence: true
  validates :title, presence: true
  validates :window_width, numericality: {greater_than: 0}
  validates :window_height, numericality: {greater_than: 0}

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
