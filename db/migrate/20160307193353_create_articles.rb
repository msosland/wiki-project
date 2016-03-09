class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.boolean :featured
      t.integer :author_id, null: false
      t.integer :category_id, null: false

      t.timestamps null: false
    end
  end
end
