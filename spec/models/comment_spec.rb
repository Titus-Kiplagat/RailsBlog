# == Schema Information
#
# Table name: comments
#
# id         :integer  not null, primary key
# user_id    :integer  not null, foreign key: true
# post_id    :integer  not null, foreign key: true
# text       :text     not null
# created_at :datetime not null
# updated_at :datetime not null

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.build(name: 'John') }
  let(:post) { Post.build(title: 'Title', author: user) }

  it 'is valid with existing user and post' do
    expect(Comment.build(user: user, post: post, text: 'Text')).to be_valid
  end

  it 'is invalid without a user' do
    expect(Comment.build(post: post, text: 'Text')).to_not be_valid
  end

  it 'is invalid without a post' do
    expect(Comment.build(user: user, text: 'Text')).to_not be_valid
  end

  describe '#update_post_comments_count' do
    it 'updates the post\'s comments_counter' do
      comment = Comment.create(user: user, post: post, text: 'Text')
      expect(comment.post.comments_counter).to eq(1)
    end
  end
end
