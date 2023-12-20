class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	after_save :update_post_comments_count

	def update_post_comments_count
		post.update(comments_counter: post.comments.count)
	end
end
