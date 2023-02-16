require 'date'
class Item
  attr_reader :publish_date

  def initialize(id, publish_date, archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    @publish_date < Date.today - (10 * 365)
  end

  def move_to_archive
    return unless can_be_archived?

    @archived = true
  end
end
