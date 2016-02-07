require "rails_helper"

RSpec.feature "Showing an Article" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Billy", email: "john@example.com", password: "password")
    @fred = User.create(first_name: "Fred", last_name: "Bloor", email: "fred@example.com", password: "password")
    @article = Article.create(title: "The first article", body: "Body of first article", user: @john)
  end
  
  scenario "A non-logged-in user does not see Edit or Delete links on article show view" do
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    
    expect(page).not_to have_link("Edit")
    expect(page).not_to have_link("Delete")
  end
  
  scenario "A non-owner logged-in cannot see both links" do
    login_as(@fred)
    
    visit "/"
    
    click_link @article.title
    
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  
  scenario "A logged-in owner sees both links" do
    login_as(@john)
    
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end
  
  scenario "show an article" do
    visit "/"
    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
  
end