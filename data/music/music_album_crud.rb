require 'json'

def save_music_albums(music_albums)
  music_albums_data = music_albums.map do |music_album|
    {
      name: music_album.name,
      publish_date: music_album.publish_date.to_i,
      archived: music_album.archived,
      on_spotify: music_album.on_spotify,
      id: music_album.id
    }
  end

  File.write('./data/music/music.json', JSON.generate(music_albums_data), mode: 'w')
end
