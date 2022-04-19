require_relative './item'
class Book < Item
  attr_accessor :publisher, :cover_state

  # rubocop:disable Metrics/ParameterLists
  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(name, publish_date, publisher, cover_state, archived = false, id = Random.rand(1..10_000))
    super(name, publish_date, id, archived)
    @publisher = publisher
    @cover_state = cover_state
  end
  # rubocop:enable Metrics/ParameterLists
  # rubocop:enable Style/OptionalBooleanParameter

  private

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
