require 'rails_helper'

RSpec.describe Comment, type: :model do
  first_user = User.new(name: 'Tumaini', photo: 'https://images.unsplash.com/photo-1691610876953-8b20fee3352d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80', bio: 'Teacher from Mexico.')
  first_post = Post.new(author: first_user, title: 'Hello', text: 'This is my first post')

  it 'text should not be empty' do
    comment = Comment.new(post: first_post, author: first_user, text: 'Hi Tumaini!')
    expect(comment).to be_valid
  end

  it 'text should be empty' do
    comment = Comment.new(post: first_post, author: first_user, text: 'Hi Tumaini!')
    comment.text = nil
    expect(comment).not_to be_valid
  end
end
