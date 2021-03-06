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
require './data/genres/genre_crud'
require './data/books/book_crud'
require './data/labels/label_crud'

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
    if @labels.empty?
      @labels.push(Label.new('Gift', 'red'))
      @labels.push(Label.new('new', 'blue'))
      @labels.push(Label.new('boz', 'green'))
      @labels.push(Label.new('promotion', 'indigo'))
      save_labels(@labels)
    end
    if @authors.empty?
      @authors.push(Author.new('Stephen', 'King'))
      @authors.push(Author.new('Nuri', 'Lacka'))
      @authors.push(Author.new('Mugisha', 'Samuel'))
      @authors.push(Author.new('Pedro', 'Guerreiro'))
      save_authors(@authors)
    else
      puts ' '
    end
  end

  def run
    @authors = read_authors
    @labels = read_labels
    seed_random_data
    @games = read_games(@authors)
    @music_albums = load_music_albums
    @genres = load_genres
    @books = load_books(@labels)
  end
end
