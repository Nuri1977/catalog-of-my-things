require './app/console'
require './app/game'
require './app/author'
require './app/game_list'
require 'json'
require './data/authors/author_crud'
require './data/games/game_crud'

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

  def seed_random_data
    if @authors.empty?
      @authors.push(Author.new('Stephen', 'King'))
      @authors.push(Author.new('Nuri', 'Lacka'))
      @authors.push(Author.new('Mugisha', 'Samuel'))
      @authors.push(Author.new('Pedro', 'Guerreiro'))
      save_authors(@authors)
    else
      puts 'Data was fetched from database'
    end
  end

  def run
    puts 'This method is for fetching data from json files'
    @authors = read_authors
    seed_random_data
    @games = read_games(@authors)
  end
end
