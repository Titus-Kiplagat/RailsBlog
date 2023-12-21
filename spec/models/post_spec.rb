# ==schema information
#
# Table name: posts
#
# id               :integer  not null, primary key
# author_id        :integer  not null, foreign key: true
# title            :string   not null
# text             :text
# likes_counter    :integer  default: 0
# comments_counter :integer  default: 0
# created_at       :datetime not null
# updated_at       :datetime not null

require 'rails_helper'

RSpec.describe Post, type: :model do
	let(:user) { User.build(name: 'John') }
	# before :all do
	# 	@author = User.build(name: 'John')
	# end

  it 'is valid with a title' do
		expect(Post.build(title: 'Title', author: user)).to be_valid
	end

	it 'is invalid without a title' do
		expect(Post.build(title: '' || nil)).to_not be_valid
	end

	it 'is invalid with a title longer than 250 characters' do
		expect(Post.build(title: 'a' * 251)).to_not be_valid
	end

	it 'is invalid with a negative comments_counter' do
		expect(Post.build(comments_counter: -1)).to_not be_valid
	end

	it 'is invalid with a negative likes_counter' do
		expect(Post.build(likes_counter: -1)).to_not be_valid
	end

	it 'is invalid with a non-integer comments_counter' do
		expect(Post.build(comments_counter: 'a')).to_not be_valid
	end

	it 'is invalid with a non-integer likes_counter' do
		expect(Post.build(likes_counter: 'a')).to_not be_valid
	end

	describe '#update_user_posts_count' do
		it 'updates the author\'s post_counter' do
			post = Post.create(title: 'Title', author: user)
			expect(post.author.post_counter).to eq(1)
		end
	end

	describe '#five_most_recent_comments' do
		it 'returns the five most recent comments' do
			post = Post.create(title: 'Title', author: user)
			comments = 10.times.map do |i|
				Comment.create(post: post, user: user, text: "Comment #{i}")
			end
			expect(post.five_most_recent_comments).to eq(comments.last(5).reverse)
		end
	end
end
