require_relative '../item'
class MusicAlbum < Item
  attr_accessor :on_spotify, :id, :publish_date, :archived, :genre

  def initialize(on_spotify, id, publish_date)
    super(id, publish_date, archived: archived)
    @on_spotify = on_spotify
    @id = id
    @publish_date = publish_date
  end

  def can_be_archived?
    super() && @on_spotify
  end
end
