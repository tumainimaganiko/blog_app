require 'rails_helper'

RSpec.feature "User Index Page", type: :feature do
    before(:each) do
        @first_user = User.create(
          name: 'Tumaini Maganiko',
          photo: 'https://images.pexels.com/photos/1659438/pexels-photo-1659438.jpeg?auto=compress&cs=tinysrgb&w=800',
          bio: 'Teacher from Mexico.',
          posts_counter: 0
        )
        @first_post = Post.create(author: @first_user, title: 'Post One', text: 'This is my first post')
        @second_post = Post.create(author: @first_user, title: 'Post, two', text: 'This is my second post')
        @third_post = Post.create(author: @first_user, title: 'Post, three', text: 'This is my third post')
        @last_post = Post.create(author: @first_user, title: 'Post four', text: 'This is my fourth post')

        @second_user = User.create(
          name: 'Marco Diaz',
          photo: 'https://images.pexels.com/photos/326212/pexels-photo-326212.jpeg?auto=compress&cs=tinysrgb&w=800',
          bio: 'Teacher from Mexico.',
          posts_counter: 0
        )
        @first_post = Post.create(author: @second_user, title: 'Post, one', text: 'This is my first post')
        @second_post = Post.create(author: @second_user, title: 'Post, two', text: 'This is my second post')
        @third_post = Post.create(author: @second_user, title: 'Post, three', text: 'This is my third post')
    end

  
end
