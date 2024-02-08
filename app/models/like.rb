class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_likes_counter
  after_destroy :update_likes_counter

  def update_likes_counter
    Like.group(:post_id).count.each do |post_id, likes_count|
      Post.find(post_id).update(likes_counter: likes_count)
    end
  end
end
