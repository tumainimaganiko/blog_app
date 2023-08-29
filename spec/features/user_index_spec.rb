require 'rails_helper'

RSpec.feature "User Index Page", type: :feature do
    before(:each) do
        @first_user = User.create(
          name: 'Tumaini Maganiko',
          photo: 'https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&w=800',
          bio: 'I am a great programmer',
          posts_counter: 0
        )
        @first_post = Post.create(author: @first_user, title: 'Post One', text: 'This is my first post')
        @second_post = Post.create(author: @first_user, title: 'Post, two', text: 'This is my second post')
        @third_post = Post.create(author: @first_user, title: 'Post, three', text: 'This is my third post')
        @last_post = Post.create(author: @first_user, title: 'Post four', text: 'This is my fourth post')

        @second_user = User.create(
          name: 'Marco Diaz',
          photo: 'https://images.pexels.com/photos/326212/pexels-photo-326212.jpeg?auto=compress&cs=tinysrgb&w=800',
          bio: 'I am a great programmer',
          posts_counter: 0
        )
        @first_post = Post.create(author: @second_user, title: 'Post, one', text: 'This is my first post')
        @second_post = Post.create(author: @second_user, title: 'Post, two', text: 'This is my second post')
        @third_post = Post.create(author: @second_user, title: 'Post, three', text: 'This is my third post')
    end

  scenario "I can see the username of all other users" do
    visit users_path
      expect(page).to have_content('Tumaini Maganiko')
      expect(page).to have_content('Marco Diaz')
  end

  scenario "I can see the profile picture for each user" do
    visit users_path
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
      expect(page).to have_css("img[src*='#{@second_user.photo}']")
  end

  scenario "I can see the number of posts each user has written" do
    visit users_path
      expect(page).to have_content("Number of posts: 4")
      expect(page).to have_content("Number of posts: 3")
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    visit users_path  
    click_link @first_user.name

    expect(current_path).to eq(user_path(@first_user))
  end

end
