require_relative './console'
require_relative './game'
require_relative './author'
require_relative './music_album'
require_relative './genre'
require_relative './game_list'
require_relative './music_list'

class App
  include Console
  include GameList
  include MusicList

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
