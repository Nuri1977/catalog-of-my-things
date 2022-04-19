class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, _items, id = Random.rand(1..100_000))
    @id = id
    @title = title
    @color = color
    @items = []
  end
end
