class PostsController < ApplicationController
  def index
    @posts = User.find_by(id: params['user_id'])
  end

  
end
