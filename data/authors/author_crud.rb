def save_authors(authors)
  authors_store = authors.map do |author|
    {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name
    }
  end
  file = File.open('./data/authors/authors.json', 'w')
  file.puts(JSON.pretty_generate(authors_store))
  file.close
end

def read_authors
  if File.exist?('./data/authors/authors.json')
    authors = JSON.parse(File.read('./data/authors/authors.json'))
    authors.map do |author|
      Author.new(author['first_name'], author['last_name'], author['id'])
    end
  else
    []
  end
end
