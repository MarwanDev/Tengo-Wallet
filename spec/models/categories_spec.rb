require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:transaction_categories).dependent(:destroy) }
    it { should have_many(:transactions).through(:transaction_categories).source('my_transaction') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end
end
