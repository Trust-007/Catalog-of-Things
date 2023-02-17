require_relative 'book'
require('./label/save_item')
require('./label/label')

class BookLabel
  attr_accessor :book, :labels

  def initialize
    base = "#{Dir.pwd}/saved_data"
    fetch_labels = File.read("#{base}/labels.json")
    fetch_books = File.read("#{base}/books.json")

    @books = []
    @labels = []

    unless fetch_books == ''
      JSON.parse(fetch_books).each do |book|
        @books.push(Book.new(book['publish_date'], book['publisher'], book['cover_state']))
      end
    end

    return if fetch_labels == ''

    JSON.parse(fetch_labels).each do |label|
      @labels.push(Label.new(label['title'], label['color']))
    end
  end

  def add_book
    print 'Enter the title:'
    title = gets.chomp
    print 'Enter color: '
    color = gets.chomp
    print 'Enter the date (format: yyyy-mm-dd)'
    pub_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state (Bad or Good) '
    cover_state = gets.chomp
    new_book = Book.new(Date.iso8601(pub_date), publisher, cover_state)
    new_label = Label.new(title, color)
    @labels << new_label
    @books << new_book
    save_book(@books)
    save_label(@labels)
    puts 'Book created successfully'
  end

  def list_books
    if @books.empty?
      puts 'No Books available'
    else
      @books.each do |book|
        puts "Published Date: #{book.publish_date} Cover State: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No Labels available'
    else
      @labels.each do |label|
        puts "Title: #{label.title} Color: #{label.color}"
      end
    end
  end
end
