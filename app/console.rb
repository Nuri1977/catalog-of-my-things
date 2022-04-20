module Console
  def menu
    puts
    puts 'Please choose an option by entering a number:'

    options = [
      'List all books',
      'List all music albums',
      'List of games',
      'List all genres',
      'List all labels',
      'List all authors',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit'
    ]

    options.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def console_start
    while menu
      selected = gets.chomp.to_i
      case selected
      when 1
        list_all_books
      when 2
        list_music_albums
      when 3
        list_all_games
      when 4
        list_genres
      when 5
        list_all_labels
      when 6
        list_all_authors
      when 7
        add_book
      when 8
        add_music_album
      when 9
        add_game
      when 10
        puts 'Thank you for using our app!'
        break
      else
        puts 'Please choose an appropriate number'
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
