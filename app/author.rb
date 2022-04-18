class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name, id = Random.rand(1..10_000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
end
