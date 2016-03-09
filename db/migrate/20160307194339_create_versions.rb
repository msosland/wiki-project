class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.text :content, null: false
      t.integer :article_id, null: false
      t.integer :editor_id, null: false
      t.timestamps null: false
    end
  end
end
