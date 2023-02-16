require 'date'
require './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, archived: false)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    time_elapsed = (Date.today - @last_played_at).to_i
    two_years = 730
    super && time_elapsed > two_years
  end
end
