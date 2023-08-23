require 'rails_helper'

RSpec.describe 'users' do
  describe 'users/index', type: :view do
    it 'response body includes correct placeholder text' do
      render template: 'users/index'

      expect(rendered).to have_selector('h1', text: 'Here is a index page for a given user')
    end
  end
  describe 'users/show', type: :view do
    it 'response body includes correct placeholder text' do
      render template: 'users/show'

      expect(rendered).to have_selector('h1', text: 'Here is a list of posts for a given user')
    end
  end

  
end
