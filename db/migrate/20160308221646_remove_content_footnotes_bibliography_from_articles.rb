class RemoveContentFootnotesBibliographyFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :content
    remove_column :articles, :bibliography
    remove_column :articles, :footnotes
  end
end
