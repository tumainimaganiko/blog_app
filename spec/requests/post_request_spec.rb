require 'rails_helper'

RSpec.describe 'Posts' do
  describe 'posts/index', type: :view do
    it 'response body includes correct placeholder text' do
      render template: 'posts/index'

      expect(rendered).to have_selector('h1', text: 'Here is the index page of your posts for a given user')
    end
  end
  describe 'posts/show', type: :view do
    it 'response body includes correct placeholder text' do
      render template: 'posts/show'

      expect(rendered).to have_selector('h1', text: 'Here is a list of posts for a given user')
    end
  end

  
end
