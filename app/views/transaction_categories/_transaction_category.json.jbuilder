json.extract! transaction_category, :id, :category_id, :transaction_id, :created_at, :updated_at
json.url transaction_category_url(transaction_category, format: :json)
