require('./item')
require 'date'
class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date, :archived

  def initialize(publish_date, publisher, cover_state, archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return true if super || @cover_state == 'Bad'

    false
  end
end
