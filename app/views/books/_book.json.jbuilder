json.extract! book, :id, :title, :description, :download_url, :status, :created_at, :updated_at
json.url book_url(book, format: :json)
