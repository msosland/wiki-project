require 'rails_helper'

describe User do
  let!(:user1) {User.create(username: "Bob", password: "1234", status: 'member')}
  let!(:user2) {User.create(username: "Boris", password: "bluejeans", status: 'admin')}
  let!(:user3) {User.create(username: "Felicia", password: "bye", status: 'guest')}
  let!(:article1) {user1.articles.create(title: "Squirrel Food", featured: false)}
  let!(:version1) {Version.create(content: "Squirrel food is good", article_id: article1.id, editor_id: user1.id)}


  describe "New user creation" do
    it "returns a User object when a new user is created" do
      expect(user1).to be_a User
    end

    it "returns a username when username is called" do
      expect(user1.username).to eq("Bob")
    end

  end

  describe "#admin?" do
    it "returns true if user is an admin" do
      expect(user2.admin?).to be true
    end

    it "returns false if user is not an admin"  do
      expect(user1.admin?).to be false
    end
  end

  describe "#guest?" do
    it "returns true if user is an guest" do
      expect(user3.guest?).to be true
    end

    it "returns false if user is not an guest"  do
      expect(user1.guest?).to be false
    end
  end

  describe "#member?" do
    it "returns true if user is an member" do
      expect(user1.member?).to be true
    end

    it "returns false if user is not an member"  do
      expect(user3.member?).to be false
    end
  end

  describe "User is associated with articles" do
    it "returns the author's username associated with an article" do
      expect(article1.author).to eq(user1)
    end

    it "returns articles associated with a user" do
      expect(user1.articles).to all be_a Article
    end
  end

  describe "User is associated with edited articles" do
    it "returns edited articles associated with a user" do
      expect(user1.edited_articles).to all be_a Article
    end
  end

end
