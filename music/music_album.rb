require_relative '../item'
class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date, :archived, :genre

  def initialize(on_spotify, publish_date, archived: false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
    @publish_date = publish_date
  end

  def can_be_archived?
    super() && @on_spotify
  end
end
