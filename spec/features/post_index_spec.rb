require 'rails_helper'

RSpec.feature "User Show page", type: :feature do
    before do
        # Creating the user
        @user = User.create(
          name: 'Tumaini Maganiko',
          photo: 'https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&w=800',
          bio: 'I am a great programmer',
          posts_counter: 0
        )
        @first_post = Post.create(author: @user, title: 'Post One', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
        @second_post = Post.create(author: @user, title: 'Post, two', text: 'This is my second post', comments_counter: 0, likes_counter: 0)
        @third_post = Post.create(author: @user, title: 'Post, three', text: 'This is my third post', comments_counter: 0, likes_counter: 0)
        @last_post = Post.create(author: @user, title: 'Post four', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0)
        
        @comment1 = Comment.create(author: @user, post: @first_post, text: 'comment 1')
        @comment2 = Comment.create(author: @user, post: @first_post, text: 'comment 2')
        @comment3 = Comment.create(author: @user, post: @first_post, text: 'comment 3')
        @comment4 = Comment.create(author: @user, post: @first_post, text: 'comment 4')
        @comment5 = Comment.create(author: @user, post: @first_post, text: 'comment 5')

        # Visiting the user's show page
        visit user_posts_path(@user)
    end

    scenario "I can see the user's profile picture" do
        expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    scenario "I can see the user's username" do
        expect(page).to have_content(@user.name)
    end

    scenario "I can see the number of posts the user has written" do
        expect(page).to have_content("Number of posts: 4")
      end

      scenario "I can see a post's title" do
        expect(page).to have_content(@first_post.title)
        expect(page).to have_content(@second_post.title)
        expect(page).to have_content(@third_post.title)
        expect(page).to have_content(@last_post.title)
      end

      scenario "I can see some of the post's body" do
        expect(page).to have_content(@first_post.text)
        expect(page).to have_content(@second_post.text)
        expect(page).to have_content(@third_post.text)
        expect(page).to have_content(@last_post.text)
      end

      
end
