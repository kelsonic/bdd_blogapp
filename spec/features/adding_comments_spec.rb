require "rails_helper"

RSpec.feature "adding comments to articles" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Crow", email: "john@example.com", password: "password")
    @fred = User.create(first_name: "Fred", last_name: "Bloor", email: "fred@example.com", password: "password")
    
    @article = Article.create(title: "The first article", body: "body of first article", user: @john)
  end
  
  scenario "permits a logged-in user to write a comment" do
    login_as(@fred)
    
    visit "/"
    
    click_link @article.title
    
    fill_in "New Comment", with: "An awesome article"
    click_button "Add Comment"
    
    expect(page).to have_content("Comment was created successfully")
    expect(page).to have_content("An awesome article")
    expect(current_path).to eq(article_path(@article.comments.last.id))
  end
  
end