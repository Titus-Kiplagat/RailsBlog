class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_posts_counter
    Post.group(:author_id).count.each do |author_id, posts_count|
      User.find(author_id).update(posts_counter: posts_count)
    end
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
