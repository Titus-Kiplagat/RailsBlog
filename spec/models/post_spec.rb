require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.build(title: 'New Post', text: 'This is a new post.', author: author) }

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title).with_message("can't be blank") }
    it { should validate_length_of(:title).is_at_most(250).with_message('is too long (maximum is 250 characters)') }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0).only_integer }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0).only_integer }
  end

  describe 'methods' do
    # describe '#update_posts_counter' do
    #   it 'updates the posts_counter attribute of the author' do
    #     5.times { |i| author.posts.create(title: "Post #{i}") }
    #     expect { author.posts.create(title: 'New Post') }.to change { author.reload.posts_counter }.from(5).to(6)
    #   end
    # end

    describe '#recent_comments' do
      it 'returns the 5 most recent comments' do
        6.times { |i| subject.comments.build(text: "Comment #{i}", created_at: i.days.ago) }
        expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
      end
    end
  end
end
