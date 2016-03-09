require 'rails_helper'

describe Version do
  let!(:user1) {User.create(username: "Bob", password: "1234", status: 'member')}
  let!(:category1) {Category.create(title: "Squirrels")}
  let!(:article1) {Article.create(title: "Squirrel Food", featured: false, author_id: user1.id, category_id: category1.id)}
  let!(:version1) {Version.create(content: "Squirrel food is good", editor_id: user1.id, article_id: article1.id)}
  let!(:version2) {Version.create(content: "Squirrel food is really good", editor_id: user1.id, article_id: article1.id)}



  describe "New version creation" do
    it "returns a version object when a new version is created" do
      expect(version1).to be_a Version
    end

    it "returns the editor's username associated with a version" do
      expect(version1.editor.username).to eq("Bob")
    end
  end

  describe "Version is associated with article" do
    it "returns the article associated with an version" do
      expect(version1.article.title).to eq("Squirrel Food")
    end
  end
end

