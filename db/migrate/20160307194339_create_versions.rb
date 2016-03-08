class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.text :content
      t.integer :article_id
      t.integer :editor_id

      t.timestamps null: false
    end
  end
end
