require_relative '../../app/genre'

describe Genre do
  before :each do
    @genre = Genre.new('Metal')
  end

  context 'When testing the Genre class' do
    it 'should have an object with the instance of Genre' do
      genre_class = @genre.class

      expect(genre_class).to be Genre
    end

    it 'should add an object to items array' do
      music_album = double('MusicAlbum', name: 'Piece of Mind (2015 - Remaster)')

      allow(music_album).to receive(:add_genre=) { @genre }

      @genre.add_item(music_album)
      genre_items = @genre.items

      expect(genre_items.length).to eq 1
    end
  end
end
