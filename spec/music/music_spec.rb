require_relative '../../app/music_album'

describe MusicAlbum do
  before :each do
    @music = MusicAlbum.new('Piece of Mind (2015 - Remaster)', Time.new(1983, 0o5, 16), true, true)
  end

  context 'When testing the MusicAlbum class' do
    it 'should have an object with the instance of Solver' do
      music_class = @music.class

      expect(music_class).to be MusicAlbum
    end

    it 'should return a boolean value depending on published_date (longer than 10 years) and is on spotify' do
      music_archived = @music.can_be_archived?

      expect(music_archived).to be true

      @music.on_spotify = false

      music_archived = @music.can_be_archived?

      expect(music_archived).to be false
    end
  end
end
