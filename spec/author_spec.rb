require './app/game'
require './app/item'
require './app/author'

describe Author do
  context 'When testing the Author class' do
    before(:each) do
      @author1 = Author.new('Nuri', 'Lacka')
      @author2 = Author.new('Mugisha', 'Samuel')
    end

    it 'should show new author instance created' do
      expect(@author1).to be_instance_of(Author)
    end

    it 'should show Author attributes values' do
      expect(@author1.id).to be_between(1, 10_000).inclusive
      expect(@author1.first_name).to eq 'Nuri'
      expect(@author1.last_name).to eq 'Lacka'
      expect(@author2.first_name).to eq 'Mugisha'
      expect(@author2.last_name).to eq 'Samuel'
    end

    it 'The add_item method adds music albums' do
      @game1 = Game.new('Minecraft', Time.new(2001, 4, 14), true, Time.new(2018, 4, 14))
      @game2 = Game.new('Dota all stars', Time.new(2016, 4, 14), true, Time.new(2017, 4, 14))
      @game1.author = @author1
      @game2.author = @author2
      expect(@author1.items.length).to eq 1
      expect(@author2.items[0]).to be @game2
      expect(@author2.items[0].name).to eq 'Dota all stars'
    end
  end
end
