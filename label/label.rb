require 'json'
require_relative('./save_item')
require('./item')
require 'date'
class Label
  attr_accessor :title, :color, :items
  attr_reader :id

  def initialize(title, color)
    @id = Random.rand(1...100000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
    item_data = {
      id: item.id,
      date: item.publish_date,
      archived: item.archived
    }
    save_item(item_data)
  end
end
