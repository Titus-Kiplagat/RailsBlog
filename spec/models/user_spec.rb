# == Schema Information
#
# Table name: users
#
# id           :integer  not null, primary key
# created_at   :datetime not null
# updated_at   :datetime not null
# name         :string   not null
# photo        :string
# bio          :text
# post_counter :integer  default: 0

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user has a name' do
    expect(User.build(name: 'John Doe')).to be_valid
  end

  it "user's name is blank" do
    expect(User.build(name: '' || nil)).not_to be_valid "User's name cannot be blank"
  end

  it 'non-negative post_counter' do
    expect(User.build(name: 'John', post_counter: 0)).to be_valid
  end

  it 'negative post_counter' do
    expect(User.build(name: 'John', post_counter: -1)).not_to be_valid "User's post_counter cannot be negative"
  end

  describe '#three_most_recent_posts' do
    it 'returns three most recent posts' do
      user = User.create(name: 'John Doe')
      post1 = user.posts.create(title: 'Post 1')
      post2 = user.posts.create(title: 'Post 2')
      post3 = user.posts.create(title: 'Post 3')
      post4 = user.posts.create(title: 'Post 4')
      posts = [post1, post2, post3, post4]

      expect(user.three_most_recent_posts).to eq(posts.last(3).reverse)
    end
  end
end
