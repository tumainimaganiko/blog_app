class RenameColumnsInPost < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :Title, :title
    rename_column :posts, :Text, :text
  end
end
