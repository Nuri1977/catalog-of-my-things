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
  end

  it 'test if move_to_archive method works correctly' do
    expect(@book.move_to_archive).to be true
  end
end
