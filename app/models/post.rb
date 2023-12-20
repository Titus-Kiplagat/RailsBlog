class Post < ApplicationRecord
	belongs_to :author, foreign_key: :author_id, class_name: 'User'
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	def update_user_posts_count
		author.update(post_counter: author.posts.count)
	end

	def five_most_recent_comments
		comments.order(created_at: :desc).limit(5)
	end
end
