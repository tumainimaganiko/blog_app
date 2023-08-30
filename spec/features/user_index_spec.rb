require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    # Creating the first User
    @first_user = User.create(name: 'Tumaini Maganiko', photo: 'https://image.com/image.jpg',
                              bio: 'I am a great programmer', posts_counter: 0)
    @first_post = Post.create(author: @first_user, title: 'Post One', text: 'This is my first post')

    # Creating the Second User
    @second_user = User.create(name: 'Marco Diaz', photo: 'https://image.com/image2.jpg',
                               bio: 'I am a great programmer', posts_counter: 0)
    @first_post = Post.create(author: @second_user, title: 'Post, one', text: 'This is my first post')
    @second_post = Post.create(author: @second_user, title: 'Post, two', text: 'This is my second post')

    # Visiting the index page
    visit users_path
  end

  scenario 'I can see the username of all other users' do
    expect(page).to have_content('Tumaini Maganiko')
    expect(page).to have_content('Marco Diaz')
  end

  scenario 'I can see the profile picture for each user' do
    expect(page).to have_css("img[src*='#{@first_user.photo}']")
    expect(page).to have_css("img[src*='#{@second_user.photo}']")
  end

  scenario 'I can see the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 2')
    expect(page).to have_content('Number of posts: 2')
  end

  scenario "When I click on the first user, I am redirected to that user's show page" do
    click_link @first_user.name
    expect(current_path).to eq(user_path(@first_user))
  end

  scenario "When I click  the second user, I am redirected to that user's show page" do
    click_link @second_user.name
    expect(current_path).to eq(user_path(@second_user))
  end
end
