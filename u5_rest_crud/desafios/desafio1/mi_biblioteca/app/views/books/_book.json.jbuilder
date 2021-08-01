json.extract! book, :id, :title, :author, :state, :loaned_date, :returning_date, :lend_to, :created_at, :updated_at
json.url book_url(book, format: :json)
