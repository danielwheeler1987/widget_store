class AddIndexToWidgets < ActiveRecord::Migration[5.2]
  def change
    add_index :widgets, :name
  end
end
