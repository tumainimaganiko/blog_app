require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should not be empty' do
    user = User.new(name: 'Tumaini', photo: 'https://images.unsplash.com/photo-1691610876953-8b20fee3352d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80', bio: 'User bio')
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'posts_counter should not be less than 0' do
    user = User.new(name: 'Tumaini', photo: 'https://images.unsplash.com/photo-1691610876953-8b20fee3352d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80', bio: 'User bio')
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    user = User.new(name: 'Tumaini', photo: 'https://images.unsplash.com/photo-1691610876953-8b20fee3352d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80', bio: 'User bio')
    user.posts_counter = 3
    expect(user).to be_valid
  end

  it 'posts_counter should be an integer' do
    user = User.new(name: 'Tumaini', photo: 'https://images.unsplash.com/photo-1691610876953-8b20fee3352d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80', bio: 'User bio')
    user.posts_counter = 'one'
    expect(user).to_not be_valid
  end
end