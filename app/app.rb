require './app/console'
require './app/game'
require './app/author'
require './app/game_list'

class App
  include Console
  include GameList
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
