require 'rails_helper'

RSpec.feature "User Index Page", type: :feature do
    before(:each) do
        @user = User.create(
          name: 'Tumaini Maganiko',
          photo: 'https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&w=800',
          bio: 'I am a great programmer',
          posts_counter: 0
        )
        @first_post = Post.create(author: @user, title: 'Post One', text: 'This is my first post')
        @second_post = Post.create(author: @user, title: 'Post, two', text: 'This is my second post')
        @third_post = Post.create(author: @user, title: 'Post, three', text: 'This is my third post')
        @last_post = Post.create(author: @user, title: 'Post four', text: 'This is my fourth post')
    end

  describe "User's show page" do
    before(:each) do
        visit users_path(@user)
    end

    it "should show the user's profile picture" do
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end
  end
  
end
