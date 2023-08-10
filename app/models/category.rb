class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :transaction_categories, dependent: :destroy
  has_many :transactions, through: :transaction_categories, :source => 'my_transaction'

  validates :name, :icon, presence: true
end
