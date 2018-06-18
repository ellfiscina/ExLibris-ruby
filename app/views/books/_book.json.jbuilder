json.extract! book, :id, :isbn, :title, :subtitle, :year, :pages, :edition, :language, :editor_id, :created_at, :updated_at
json.url book_url(book, format: :json)
