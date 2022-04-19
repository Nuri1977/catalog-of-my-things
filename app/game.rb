class Game
  attr_accessor :multiplayer, :last_played_at

  # rubocop:disable Metrics/ParameterLists, Style/OptionalBooleanParameter
  def initialize(name, publish_date, multiplayer, last_played_at, id = Random.rand(1..100_000), archived = false)
    super(name, publish_date, id, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
  # rubocop:enable Metrics/ParameterLists, Style/OptionalBooleanParameter

  private

  def can_be_archived?
    super && (last_played_at.year < Time.new.year - 2)
  end

end
