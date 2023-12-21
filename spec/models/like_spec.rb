# == Schema Information
#
# Table name: likes
#
# id         :integer  not null, primary key
# user_id    :integer  not null, foreign key: true
# post_id    :integer  not null, foreign key: true
# created_at :datetime not null
# updated_at :datetime not null

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.build(name: 'John') }
  let(:post) { Post.build(title: 'Title', author: user) }

  it 'is valid with existing user and post' do
    expect(Like.build(user: user, post: post)).to be_valid
  end

  it 'is invalid without a user' do
    expect(Like.build(post: post)).to_not be_valid
  end

  it 'is invalid without a post' do
    expect(Like.build(user: user)).to_not be_valid
  end

  describe '#update_post_likes_count' do
    it 'updates the post\'s likes_counter' do
      like = Like.create(user: user, post: post)
      expect(like.post.likes_counter).to eq(1)
    end
  end
end
