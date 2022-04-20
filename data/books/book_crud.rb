require 'json'
require './app/book'

def save_books(books)
  books_data = books.map do |book|
    {
      name: book.name,
      publish_date: book.publish_date.to_i,
      publisher: book.publisher,
      cover_state: book.cover_state,
      archived: book.archived,
      id: book.id,
      label_id: book.label.id
    }
  end

File.write('./data/books/books.json', JSON.generate(books_data), mode: 'w')
end
