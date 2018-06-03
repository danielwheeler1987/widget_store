class AddForeignKeysToWidgets < ActiveRecord::Migration[5.2]
  def change
    add_reference :widgets, :size, foreign_key: true
    add_reference :widgets, :color, foreign_key: true
  end
end
