class AddCategoryForeignKeyToWidgets < ActiveRecord::Migration[5.2]
  def change
    add_reference :widgets, :category, foreign_key: true
  end
end
