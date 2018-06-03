class Widget < ApplicationRecord
  paginates_per 10
  
  validates :name, :color_id, :size_id, :quantity, presence: true
  validates_numericality_of :quantity, greater_than: 0

  belongs_to :color
  belongs_to :size

  INVENTORY_WARNING_LEVEL = 2.freeze

  def inventory_issue?
    quantity <= INVENTORY_WARNING_LEVEL
  end
end
