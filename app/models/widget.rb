class Widget < ApplicationRecord
  belongs_to :color
  belongs_to :size
  belongs_to :category
  
  paginates_per 10
  
  validates :name,
            :color_id,
            :size_id,
            :category_id,
            :quantity,
            presence: true

  validates_numericality_of :quantity, greater_than: -1

  default_scope { order :name }
  scope :available, -> { where('quantity > ?', 0).order(:name) }
  scope :filter_by_name, -> (name) { where('name LIKE ?', "%#{name}%").available }
  scope :filter_by_color, -> (color_id) { where(color_id: color_id).available }
  scope :filter_by_size, -> (size_id) { where(size_id: size_id).available }
  scope :filter_by_category, -> (category_id) { where(category_id: category_id).available }

  INVENTORY_WARNING_LEVEL = 2.freeze

  def inventory_approaching_empty?
    quantity <= INVENTORY_WARNING_LEVEL
  end

  def inventory_empty?
    quantity.zero?
  end
end
