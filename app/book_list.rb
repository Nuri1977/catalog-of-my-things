require_relative './helper'

module BookList
  def list_all_books
    puts 'list of all books'
    puts 'the database is empty' if @books.empty?
    @books.each do |book|
      puts "id:#{book.id} date:#{book.publish_date.strftime('%y/%m/%d')}
        name:'#{book.name}' publisher:'#{book.publisher}' label:'#{book.label.title}' "
    end
  end

  def list_all_labels
    if @labels.empty?
      @labels.push(Label.new('Gift', 'red'))
      @labels.push(Label.new('new', 'blue'))
      @labels.push(Label.new('boz', 'green'))
      @labels.push(Label.new('promotion', 'indigo'))
    end
    puts 'list of all labels'
    puts 'the database is empty' if @labels.empty?
    @labels.each do |label|
      puts "id:#{label.id} title:'#{label.title}' color:'#{label.color}' "
    end
  end

  def add_book
    if @labels.empty?
      @labels.push(Label.new('Gift', 'red'))
      @labels.push(Label.new('new', 'blue'))
      @labels.push(Label.new('boz', 'green'))
      @labels.push(Label.new('promotion', 'indigo'))
    end
    print 'Book Name: '
    name = gets.chomp
    year = select_year
    month = select_month
    day = select_day

    print 'Enter publisher: '
    publisher = gets.chomp
    print 'Enter cover state: '
    cover_state = gets.chomp

    new_book = Book.new(name, Time.new(year, month, day), publisher, cover_state)

    puts 'Select which label the book should have:'
    @labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title}, color: #{label.color}" }

    label_index = gets.chomp.to_i
    new_book.label = @labels[label_index]
    @books.push(new_book)

    puts 'Created a book successfully!'
  end
end
