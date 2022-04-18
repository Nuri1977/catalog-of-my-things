require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, publish_date, archived = false, on_spotify = false, id = Random.rand(1..100_000))
    super(name, publish_date, archived, id)
    @on_spotify = on_spotify
  end
  # rubocop:enable Style/OptionalBooleanParameter
end
