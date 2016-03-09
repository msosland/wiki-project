require "rails_helper"
require 'spec_helper'

feature "Signing in" do
  background do
    User.create(:username => 'user', :password => 'caplin')
  end

  # scenario "Signing in with correct credentials" do
  #   visit '/login'
  #   within("#login-form") do
  #     fill_in 'username', :with => 'user'
  #     fill_in 'password', :with => 'caplin'
  #   end
  #   click_button 'Login'
  #   expect(current_path).to eq(root)
  # end

  given(:other_user) { User.create(:username => 'other@example.com', :password => 'rous') }

  scenario "Signing in with incorrect credentials" do
    visit '/login'
    within("#login-form") do
      fill_in 'username', :with => other_user.username
      fill_in 'password', :with => 'wrong'
    end
    click_button 'Login'
    expect(page).to have_content 'Invalid'
  end
end
