require 'rails_helper'

describe GithubService do
  it "allows user to log in and view info" do
    VCR.use_cassette("login_and_view_info") do
      visit "/"
      expect(page).to have_content("Log In")
    end

  end

end
