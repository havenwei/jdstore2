class Design < ApplicationRecord
  has_many :design_lists, dependent: :destroy
  belongs_to :user
end
