require_relative './helper'

module BookList
  def list_all_books
    puts 'list of all books'
    puts 'the database is empty' if @books.empty?
    @books.each do |book|
      puts
      print "id: #{book.id}, Date: #{book.publish_date.strftime('%y/%m/%d')}, "
      print "Name: '#{book.name}', Publisher: '#{book.publisher}',  Label: '#{book.label.title}' "
    end
    puts ' '
  end

  def list_all_labels
    puts 'list of all labels'
    puts 'the database is empty' if @labels.empty?
    @labels.each do |label|
      puts "id:#{label.id} title:'#{label.title}' color:'#{label.color}' "
    end
  end

  def add_book
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
    save_books(@books)
    puts 'Created a book successfully!'
  end
end
