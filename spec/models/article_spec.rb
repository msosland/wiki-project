require 'rails_helper'

describe Article do
  let!(:user1) {User.create(username: "Bob", password: "1234", status: 'member')}
  let!(:category1) {Category.create(title: "Squirrels")}
  let!(:article1) {Article.create(title: "Squirrel Food", featured: false, author_id: user1.id, category_id: category1.id)}
  let!(:version1) {Version.create(content: "Squirrel food is good", editor_id: user1.id, article_id: article1.id)}
  let!(:version2) {Version.create(content: "Squirrel food is really good", editor_id: user1.id, article_id: article1.id)}



  describe "New article creation" do
    it "returns a article object when a new article is created" do
      expect(article1).to be_a Article
    end

    it "returns a username when author.username is called on article" do
      expect(article1.author.username).to eq("Bob")
    end

  end

  describe "#current_version_content" do
    it "returns content of latest version of article" do
      expect(article1.current_version_content).to eq(version2.content)
    end

    it "does not return content of earliest version of article"  do
      expect(article1.current_version_content).to_not eq(version1.content)
    end
  end

  describe "#initial_version" do
    it "returns earliest version of article" do
      expect(article1.initial_version).to eq(version1)
    end

    it "does not return latest version of article"  do
      expect(article1.initial_version).to_not eq(version2)
    end
  end


  describe "Article is associated with category" do
    it "returns the category associated with an article" do
      expect(article1.category.title).to eq("Squirrels")
    end
  end

  describe "Article is associated with versions" do
    it "returns a collection of versions associated with an article" do
      expect(article1.versions).to all be_a Version
    end
  end
end
