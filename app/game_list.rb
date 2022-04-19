module GameList
  def list_all_games
    puts 'List of all Games.'
    puts 'Database is empty! Add a game.' if @games.empty?
    @games.each do |game|
      puts "id:#{game.id} date:#{game.publish_date.strftime('%Y/%m/%d')} MP:'#{game.multiplayer}' last_played:"
      puts "#{game.last_played_at.strftime('%Y/%m/%d')} author:#{game.author.first_name} #{game.author.last_name}"
    end
  end

  def list_all_authors
    if @authors.empty?
      @authors.push(Author.new('Nuri', 'Lacka'))
      @authors.push(Author.new('Mugisha', 'Samuel'))
    end
    puts 'List of all authors.'
    @authors.each do |author|
      puts "id:#{author.id} name:'#{author.first_name} #{author.last_name}'"
    end
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def add_game
    if @authors.empty?
      @authors.push(Author.new('Nuri', 'Lacka'))
      @authors.push(Author.new('Mugisha', 'Samuel'))
    end
    puts 'Create a new game'
    print 'Enter game name: '
    name = gets.chomp
    print 'Enter game year: '
    year = gets.chomp.to_i
    print 'Enter game month betwen 1-12: '
    month = gets.chomp.to_i
    print 'Enter game date between 1-31: '
    date = gets.chomp.to_i
    print 'Is it Multiplayer? [Y/N]: '
    multiplayer_input = gets.chomp.downcase
    multiplayer = false
    multiplayer = true if multiplayer_input == 'y'
    print 'Enter last played year: '
    year_l = gets.chomp.to_i
    print 'Enter last played month betwen 1-12: '
    month_l = gets.chomp.to_i
    print 'Enter last played date between 1-31: '
    date_l = gets.chomp.to_i
    puts 'Select index of author the game should have:'
    @authors.each_with_index { |author, index| puts "#{index}) name: #{author.first_name} #{author.last_name}" }
    author_index = gets.chomp.to_i
    new_game = Game.new(name, Time.new(year, month, date), multiplayer, Time.new(year_l, month_l, date_l))
    new_game.author = @authors[author_index]
    @games.push(new_game)
    puts 'New game was created'
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
