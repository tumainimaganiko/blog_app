require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.new(name: 'Tumaini', photo: 'https://images.unsplash.com/photo-1691610876953-8b20fee3352d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80', bio: 'Teacher from Mexico.')

  it 'title should not be empty' do
    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
    expect(first_post).to be_valid
  end

  it 'comments_counter should not be less than 0' do
    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
    first_post.comments_counter = -3
    expect(first_post).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
    first_post.comments_counter = 'one'
    expect(first_post).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
    first_post.comments_counter = 3
    expect(first_post).to be_valid
  end

  it 'likes_counter should be an integer' do
    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
    first_post.likes_counter = 'one'
    expect(first_post).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')
    first_post.likes_counter = 3
    expect(first_post).to be_valid
  end
end