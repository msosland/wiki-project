class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :featured
      t.string :footnotes
      t.text :bibliography
      t.string :status
      t.integer :author_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
