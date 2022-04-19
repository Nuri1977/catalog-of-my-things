require './app/console'
require './app/music_album'
require './app/genre'

class App
  include Console
  attr_accessor :books, :music_albums, :games, :genres,
                :lables, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = [Genre.new('Rock'), Genre.new('Metal'), Genre.new('Country')]
    @labels = []
    @authors = []
  end

  def run
    puts 'This method is for fetching data from json files'
  end

  def time_format(date)
    "#{date.year}-#{date.month}-#{date.day}"
  end

  def select_year
    print 'Year: '
    year = gets.chomp.to_i
    while year < 1800 || year > Time.now.year
      puts 'Select a correct year'
      print 'Year: '
      year = gets.chomp.to_i
    end
    year
  end

  def select_month
    print 'Month: '
    month = gets.chomp.to_i
    while month < 1 || month > 12
      puts 'Select a correct month'
      print 'Month: '
      month = gets.chomp.to_i
    end
    month
  end

  def select_day
    print 'Day: '
    day = gets.chomp.to_i
    while day < 1 || day > 31
      puts 'Select a correct day'
      print 'Day: '
      day = gets.chomp.to_i
    end
    day
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'You don\'t have any Music Albums.'
    else
      @music_albums.each_with_index do |music_album, index|
        # rubocop:disable Layout/LineLength
        puts "#{index}) Album: #{music_album.name}, Genre: #{music_album.genre.name}, Publish Date: #{time_format(music_album.publish_date)}, Archived: #{music_album.archived}, Spotify: #{music_album.on_spotify}"
        # rubocop:enable Layout/LineLength
      end
    end
  end

  def add_music_album
    print 'Album Name: '
    name = gets.chomp
    year = select_year
    month = select_month
    day = select_day

    music_album = MusicAlbum.new(name, Time.new(year, month, day))

    puts 'Select genre: '
    list_genres
    genre_index = gets.chomp.to_i
    music_album.add_genre = @genres[genre_index]
    @music_albums.push(music_album)
    puts 'Created a Music Album successfully!'
  end

  def list_genres
    if @genres.empty?
      puts 'You don\'t have any Genres.'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index}) Genre: #{genre.name}"
      end
    end
  end
end
