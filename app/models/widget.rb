class Widget < ApplicationRecord
  paginates_per 10
  
  validates :name,
            :color_id,
            :size_id,
            :category_id,
            :quantity,
            presence: true

  validates_numericality_of :quantity, greater_than: -1

  belongs_to :color
  belongs_to :size
  belongs_to :category

  scope :available, -> { where('quantity > ?', 0) }

  INVENTORY_WARNING_LEVEL = 2.freeze

  def inventory_approaching_empty?
    quantity <= INVENTORY_WARNING_LEVEL
  end

  def inventory_empty?
    quantity.zero?
  end
end
