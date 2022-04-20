require_relative './console'
require_relative './game'
require_relative './author'
require_relative './music_album'
require_relative './genre'
require_relative './game_list'
require_relative './music_list'
require 'json'
require './data/authors/author_crud'
require './data/games/game_crud'
require_relative './book_list'
require_relative './label'
require_relative './book'

class App
  include Console
  include GameList
  include MusicList
  include BookList

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
