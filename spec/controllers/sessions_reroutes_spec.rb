require "rails_helper"

describe SessionsController do
  describe "#new" do
    it "fetches login page" do
      get :new
      expect(response).to render_template("users/login")
    end
  end

  describe "#create" do
    # test {post :create, user => { username: "hey", password: "pas" }}
    # context "on invalid username-password" do
    #   it "redirects back" do
    # request.env['HTTP_REFERER'] = 'http://localhost:3000/sessions/new'
    #     expect(test).to redirect_to("/")
    #   end
    # end

    context "on valid username-password" do
      # it "redirects to main page" do
      #   User.create({
      #                 username: "testing",
      #                 password: "password",
      #               })
      #   post :create, { user: { username: "testing", password: "password" }}
      #   expect(current_path).to eq(root)
      # end

      # it "sets session[:user_id]" do
      #   user = User.create({
      #                 username: "testing",
      #                 password: "password",
      #               })
      #   request.env['HTTP_REFERER'] = 'http://localhost:3000/login'
      #   post :create, { user: { username: "testing", password: "password" }}
      #   expect(session[:user_id]).to eq(user.id)
      # end
    end
  end

  describe "#destroy" do
    it "deletes session" do
      session[:user_id] = "test"
      get :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end