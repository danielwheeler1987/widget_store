class AddTwoMoreColumnsToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :widget, foreign_key: true
    add_column :order_items, :quantity, :integer
  end
end
