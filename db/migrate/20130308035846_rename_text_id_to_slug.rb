class RenameTextIdToSlug < ActiveRecord::Migration
  def change
    rename_column :pages, :text_id, :slug
  end
end
