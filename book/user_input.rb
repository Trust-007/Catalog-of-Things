require('./book')
require('./label')

class BookLabel
  attr_accessor :book, :labels
  
  def initialize
    @books = []
    @labels = []
  end

  def add_book
    print 'Enter the date (format: yyyy-mm-dd)'
    pub_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state (Bad or Good) '
    cover_state = gets.chomp
    new_book = Book.new(Date.iso8601(pub_date), publisher, cover_state)
    new_game.add_author(@temp)
    @books << new_game
    puts 'Book created successfully'
  end

  def create_label
    print 'Title: '
    title = gets.chomp
    print 'Color '
    color = gets.chomp
    new_label = Label.new(title, color)
    @labels << new_label
    @temp = new_author
  end
end