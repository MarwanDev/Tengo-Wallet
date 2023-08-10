require 'rails_helper'

RSpec.describe TransactionCategory, type: :model do
  describe 'associations' do
    it { should belong_to(:category).class_name('Category') }
    it { should belong_to(:my_transaction).class_name('Transaction') }
  end
end
