require 'rails_helper'
RSpec.feature 'Post show page', type: :feature do
  before do
    @user = User.create(name: 'Tumaini Maganiko', photo: 'https://image.com/image.jpg', bio: 'I am a great programmer',
                        posts_counter: 0)
    @first_post = Post.create(author: @user, title: 'Post One', text: 'This is my first post', comments_counter: 0,
                              likes_counter: 0)
    @second_post = Post.create(author: @user, title: 'Post, two', text: 'This is my second post',
                               comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(author: @user, post: @first_post, text: 'comment 1')
    @comment2 = Comment.create(author: @user, post: @first_post, text: 'comment 2')
    visit user_post_path(@user, @first_post)
  end

  scenario "I can see the post's title" do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'I can see who wrote the post' do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see how many comments it has' do
    expect(page).to have_content('comments: 2')
  end

  scenario 'I can see how many likes it has' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'I can see the post body' do
    expect(page).to have_content(@first_post.text)
  end
end

RSpec.feature 'Post show page', type: :feature do
  before do
    @user = User.create(name: 'Tumaini Maganiko', photo: 'https://image.com/image.jpg', bio: 'I am a great programmer',
                        posts_counter: 0)
    @first_post = Post.create(author: @user, title: 'Post One', text: 'This is my first post', comments_counter: 0,
                              likes_counter: 0)
    @second_post = Post.create(author: @user, title: 'Post, two', text: 'This is my second post',
                               comments_counter: 0, likes_counter: 0)
    @comment1 = Comment.create(author: @user, post: @first_post, text: 'comment 1')
    @comment2 = Comment.create(author: @user, post: @first_post, text: 'comment 2')
    visit user_post_path(@user, @first_post)
  end

  scenario 'I can see the username of each commentor' do
    expect(page).to have_content(@comment1.author.name)
    expect(page).to have_content(@comment2.author.name)
  end

  scenario 'I can see the comment each commentor left' do
    expect(page).to have_content(@comment1.text)
    expect(page).to have_content(@comment2.text)
  end
end
