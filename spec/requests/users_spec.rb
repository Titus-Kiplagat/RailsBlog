require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get users_path
      expect(response).to be_successful
    end

    it 'retrieves all users' do
			user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      get users_path
      expect(users_path).to eq([user])
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end
  end
end
