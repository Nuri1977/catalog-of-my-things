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
      'Add a movie',
      'Add a game',
      'Exit'
    ]

    options.each_with_index do |option, index|
      puts "#{index + 1} - #{option}"
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def console_start
    while menu
      selected = gets.chomp.to_i
      case selected
      when 1
        puts 'List all books'
      when 2
        puts list_music_albums
      when 3
        puts 'list_games'
      when 4
        puts 'list_genres'
      when 5
        puts 'list_labels'
      when 6
        puts 'list_authors'
      when 7
        puts 'add_book'
      when 8
        puts 'add_music_album'
      when 9
        puts 'add_movie'
      when 10
        puts 'add_game'
      when 11
        puts 'Thank you for using our app!'
        break
      else
        puts 'Please choose an appropriate number'
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end
