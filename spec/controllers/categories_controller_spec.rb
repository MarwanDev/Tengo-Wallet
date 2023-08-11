require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  let(:user) { User.new(name: 'Mario', email: 'mario@mario.com', password: 'password') }
  let(:category) do
    Category.new(name: 'cat 1',
                 icon: 'https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg',
                 user: @user)
  end
  before do
    user.save
    post user_session_path, params: { user: { email: user.email, password: user.password } }
    follow_redirect!
    category.save
  end
  describe 'GET category#index' do
    it 'returns a successful response' do
      get categories_path
      expect(response).to be_successful
    end
  end

  describe 'POST category#new' do
    it 'returns a successful response' do
      get new_category_path
      expect(response).to be_successful
    end
  end
end
