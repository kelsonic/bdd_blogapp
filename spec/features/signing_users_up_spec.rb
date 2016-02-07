require "rails_helper"

RSpec.feature "Users signup" do
  
  scenario "with valid credentials" do
    visit "/"
    
    click_link "Sign Up"
    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Conroy"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    
    click_button "Sign Up"
    
    expect(page).to have_content("You have signed up successfully")
  end
  
end