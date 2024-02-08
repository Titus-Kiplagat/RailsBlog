class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_comments_counter
  after_destroy :update_comments_counter

  def update_comments_counter
    Comment.group(:post_id).count.each do |post_id, comments_count|
      Post.find(post_id).update(comments_counter: comments_count)
    end
  end
end
