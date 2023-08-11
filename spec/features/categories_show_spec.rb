require 'rails_helper'

RSpec.feature 'Categories', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(
      name: 'Marwan',
      email: 'user@example.com',
      password: 'password',
      confirmed_at: '2023-08-10 13:46:21.825849',
      confirmation_sent_at: '2023-08-10 13:46:18.95477'
    )
    sign_in @user
    @category =
      Category.create(
        name: 'cat 1',
        icon: 'https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg',
        user: @user
      )
    @transaction =
      Transaction.create(
        name: 'tran 1',
        amount: 15,
        author: @user
      )
    @transaction_category =
      TransactionCategory.create(
        category: @category,
        my_transaction: @transaction
      )
  end

  describe '#show' do
    it 'should display categories' do
      visit category_path(@category)
      expect(page).to have_content(@category.name)
      expect(page).to have_css('img')
      expect(page).to have_content(@category.transactions.sum(:amount))
      expect(page).to have_content(@transaction.name)
      expect(page).to have_content(@transaction.amount)
      expect(page).to have_content('New Transaction')
    end
  end
end
