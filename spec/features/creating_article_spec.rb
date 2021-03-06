require 'rails_helper'

RSpec.feature "Creating Articles" do
  
  before do
    @john = User.create!(first_name: "John", last_name: "Blunt", email: "john@example.com", password: "password")
    login_as(@john)
  end
  
  scenario "A user creates a new article" do
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: "Creating first article"
    fill_in "Body", with: "Lorem Ipsum and this must be at least 10 characters long"
    click_button "Create Article"
    
    expect(page).to have_content("Your article was created successfully")
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by #{@john.first_name}")
  end
  
  scenario "A user fails to create a new article" do
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"
    
    expect(page).to have_content("Your article was not created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
  
end