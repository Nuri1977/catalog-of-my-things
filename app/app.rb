require './app/console'

class App
  include Console
  attr_accessor :books, :music_albums, :games, :genres,
                :lables, :authors

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  def run
    puts 'This method is for fetching data from json files'
  end

  def time_format(date)
    "#{date.year}-#{date.month}-#{date.day}"
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'You don\'t have any Music Albums.'
    else
      @music_albums.each_with_index do |music_album, index|
        # rubocop:disable Layout/LineLength
        puts "#{index}) Album: #{music_album.name}, Publish Date: #{time_format(music_album.publish_date)}, Archived: #{music_album.archived}, Spotify: #{music_album.on_spotify}"
        # rubocop:enable Layout/LineLength
      end
    end
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
