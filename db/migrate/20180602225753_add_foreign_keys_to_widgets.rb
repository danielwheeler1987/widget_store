class AddForeignKeysToWidgets < ActiveRecord::Migration[5.2]
  def change
    add_reference :widgets, :sizes, foreign_key: true
    add_reference :widgets, :colors, foreign_key: true
  end
end
