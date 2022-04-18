require './app/game'
require './app/item'
require './app/author'

describe Game do
  context 'When testing the Game class' do
    before(:each) do
      @game1 = Game.new('Minecraft', Time.new(2001, 4, 14), true, Time.new(2018, 4, 14))
      @game2 = Game.new('Dota all stars', Time.new(2016, 4, 14), true, Time.new(2017, 4, 14))
      @game3 = Game.new('Counter strike', Time.new(2005, 4, 14), true, Time.new(2022, 4, 14))
    end

    it 'should show new Game instance created' do
      expect(@game1).to be_instance_of(Game)
    end

    it 'should show Game attributes values' do
      expect(@game1.id).to be_between(1, 10_000).inclusive
      expect(@game1.publish_date).to eq Time.new(2001, 4, 14)
      expect(@game1.multiplayer).to be true
      expect(@game1.last_played_at).to eq Time.new(2018, 4, 14)
      expect(@game1.archived).to be false
    end

    it "the 'move_to_archive' method for Games works correctly" do
      @game1.move_to_archive
      @game2.move_to_archive
      @game3.move_to_archive
      expect(@game1.archived).to be true
      expect(@game2.archived).to be false
      expect(@game3.archived).to be false
    end
  end

  context 'When testing the realtions Game and Author class' do
    before(:each) do
      @game1 = Game.new('Minecraft', Time.new(2001, 4, 14), true, Time.new(2018, 4, 14))
      @game2 = Game.new('Dota all stars', Time.new(2016, 4, 14), true, Time.new(2017, 4, 14))
      @game3 = Game.new('Counter strike', Time.new(2005, 4, 14), true, Time.new(2022, 4, 14))
      @author1 = Author.new('Nuri', 'Lacka')
      @author2 = Author.new('Mugisha', 'Samuel')
      @game1.author = @author1
      @game2.author = @author1
      @game3.author = @author2
    end

    it 'The add_item method adds albums' do
      expect(@author1.items.length).to eq 2
      expect(@author1.items[0]).to be @game1
      expect(@author2.items[0].name).to eq 'Counter strike'
    end
  end
end
