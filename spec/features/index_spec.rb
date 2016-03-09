require 'rails_helper'

describe "homepage" do

  describe "navbar" do

    it "displays title and search bar" do
      visit '/'
      expect(page).to have_text("WikiJamz!")
      expect(page).to have_text("Submit")
    end
  end
end
