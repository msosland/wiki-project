require 'rails_helper'

describe "Categories" do

  describe "homepage" do
    it 'should show categories on home page' do
      category = Category.create(title: "trains")
      visit '/'
      expect(page).to have_text(category.title)
    end

    it 'should show a featured article' do
      category = Category.create(title: "trains")
      user = User.create(username: "user", password: "password")
      article = Article.create(title: "train", author_id: user.id, category_id: category.id, featured: true)
      version = Version.create(editor_id: user.id, article_id: article.id, content: "this")
      visit '/'
      expect(page).to have_text('Featured Article')
    end
  end

  describe '#show' do
    it 'should go to show page if user clicks on category title' do
      category = Category.create(title: "trains")
      visit '/'
      click_link("#{category.title}")
      expect(current_path).to eq(category_path(category))
    end
  end
end
