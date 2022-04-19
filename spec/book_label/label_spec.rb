require_relative '../../app/label'
require_relative '../../app/book'

describe 'tests for label class' do
  before :each do
    @book = Book.new('sam', Time.new(2020, 11, 0o5), 'longhorn', 'bad')
    @label = Label.new('giancoli', 'red')
    @book.label = @label
  end

  it 'tests to see if it returns the label instance' do
    expect(@label).to be_instance_of(Label)
  end

  it 'check if it returns true parameters' do
    expect(@label.title).to eq('giancoli')
    expect(@label.color).to eq('red')
  end

  it 'test if add_item method works correctly' do
    expect(@label.items.length).to eq 1
    expect(@label.items[0]).to be @book
  end
end
