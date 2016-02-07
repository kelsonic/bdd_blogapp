require 'rails_helper'
require 'support/macros'

RSpec.describe CommentsController, type: :controller do
  
  describe "POST #create" do
    before do
      @john = User.create!(first_name: "John", last_name: "Adams", email: "john@example.com", password: "password")
    end
  end
  
  context "logged-in user" do
    it "can create a comment" do
      login_user @john
      article = Article.create(title: "First article here", body: "This is the body of the first article", user: @john)
      post :create, comment: { body: "Awesome post!" }, article_id: article.id
      expect(flash[:danger]).to eq("Comment was not created")
    end
  end
  
  context "non-logged-in user" do
    it "is redirected to the login page" do
      login_user nil
      article = Article.create(title: "First article here", body: "This is the body of the first article", user: @john)
      post :create, comment: { body: "Awesome post!" }, article_id: article.id
      expect(response).to redirect_to new_user_session_path
    end
  end

end
