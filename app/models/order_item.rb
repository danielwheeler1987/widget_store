class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :widget

  validates :order_id, :widget_id, presence: true 
end
