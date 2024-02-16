require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.build(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter).is_greater_than_or_equal_to(0).only_integer }
  end

  describe '#recent_posts' do
    it 'returns the 3 most recent posts' do
      6.times { |i| subject.posts.create(title: "Post #{i}", created_at: i.days.ago) }
      expect(subject.recent_posts).to eq(subject.posts.order(created_at: :desc).limit(3))
    end
  end
end
