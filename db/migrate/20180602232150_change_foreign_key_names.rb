class ChangeForeignKeyNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :widgets, :sizes_id, :size_id
    rename_column :widgets, :colors_id, :color_id
  end
end
