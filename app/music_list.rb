require_relative './helper'
require_relative './music_album'

module MusicList
  include Helper
  def list_music_albums
    if @music_albums.empty?
      puts 'You don\'t have any Music Albums.'
    else
      @music_albums.each_with_index do |music_album, index|
        # rubocop:disable Layout/LineLength
        puts "#{index}) Album: #{music_album.name}, Genre: #{@genres.empty? ? 'No genre' : music_album.genre.name}, Publish Date: #{time_format(music_album.publish_date)}, Archived: #{music_album.archived}, Spotify: #{music_album.on_spotify}"
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

    unless @genres.empty?
      puts 'Select genre: '
      list_genres
      genre_index = gets.chomp.to_i
      music_album.add_genre = @genres[genre_index]
    end
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
