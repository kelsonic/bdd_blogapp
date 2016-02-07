require 'rails_helper'

RSpec.feature "Users login" do
  
  before do
    @john = User.create!(first_name: "John", last_name: "Adams", email: "john@example.com", password: "password")
  end
  
  scenario "with valid credentials" do
    visit '/'
    
    click_link "Login"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Login"
    
    expect(page).to have_content("Signed in successfully")
  end
  
end