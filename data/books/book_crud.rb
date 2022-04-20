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

def load_books(labels)
  book_json = File.read('./data/books/books.json')
  book_data = []
  # genres_data = load_genres
  if book_json.empty?
    book_data
  else
    JSON.parse(book_json).each do |book|
      book_item = Book.new(book['name'], Time.at(book['publish_date']),
                           book['publisher'], book['cover_state'], book['archived'], book['id'])
      labels.each do |label|
        book_item.label = label if label.id == book['label_id']
      end
      book_data.push(book_item)
    end
  end
  book_data
end
