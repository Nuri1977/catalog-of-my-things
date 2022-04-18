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
end
