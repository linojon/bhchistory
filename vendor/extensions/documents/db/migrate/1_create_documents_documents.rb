class CreateDocumentsDocuments < ActiveRecord::Migration

  def up
    create_table :refinery_documents do |t|
      t.string :title
      t.string :category
      t.string :subject
      t.string :doctype
      t.text :description
      t.date :date
      t.string :source
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-documents"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/documents/documents"})
    end

    drop_table :refinery_documents

  end

end
