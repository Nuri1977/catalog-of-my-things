require_relative '../../app/book'

describe 'tests for book class' do
  before :each do
    @book = Book.new('sam', Time.new(2020, 11, 0o5), 'longhorn', 'bad')
  end

  it 'tests to see if it returns the book instance' do
    expect(@book).to be_instance_of(Book)
  end

  it 'check if it returns true parameters' do
    expect(@book.name).to eq('sam')
    expect(@book.publish_date).to eq Time.new(2020, 11, 0o5)
    expect(@book.publisher).to eq('longhorn')
    expect(@book.cover_state).to eq('bad')
    expect(@book.id).to be_between(1, 10_000).inclusive
  end

  it 'test if can_be_archived? method works correctly' do
    @book.move_to_archive
    expect(@book.archived).to be true
  end
end
