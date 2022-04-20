require_relative '../../app/music_album'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new('Piece of Mind (2015 - Remaster)', Time.new(1983, 0o5, 16), true, true)
  end

  context 'When testing the MusicAlbum class' do
    it 'should have an object with the instance of MusicAlbum' do
      music_class = @music.class

      expect(music_class).to be MusicAlbum
    end

    it 'should return a boolean value depending on published_date (longer than 10 years) and is on spotify' do
      @music.move_to_archive

      expect(@music.archived).to be true

      another_music = MusicAlbum.new('Thriller', Time.new(2001, 0o7, 13), false, false)

      another_music.move_to_archive

      expect(another_music.archived).to be false
    end
  end
end
