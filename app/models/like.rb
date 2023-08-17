class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_posts_like_counter

  def update_posts_like_counter
    post.increment!(:likes_counter)
  end
end
