class RemoveDocumentHasOneImage < ActiveRecord::Migration
  def up
    remove_column :refinery_documents, :image_id
  end

  def down
  end
end
