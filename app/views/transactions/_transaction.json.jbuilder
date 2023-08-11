json.extract! transaction, :id, :name, :author_id, :amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
