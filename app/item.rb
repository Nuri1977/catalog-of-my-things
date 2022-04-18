class Item
  attr_accessor :name, :publish_date
  attr_reader :id, :archived

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, publish_date, id = Random.rand(1..100_000), archived = false)
    @id = id
    @name = name
    @publish_date = publish_date
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
