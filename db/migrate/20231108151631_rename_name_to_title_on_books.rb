class RenameNameToTitleOnBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :name, :title
  end
end
