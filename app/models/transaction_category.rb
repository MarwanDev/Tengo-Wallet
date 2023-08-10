class TransactionCategory < ApplicationRecord
  belongs_to :category, class_name: 'Category'
  belongs_to :my_transaction, class_name: "Transaction", foreign_key: "transaction_id"
end
