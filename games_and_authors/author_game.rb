require_relative 'game'
require_relative 'author'
require 'date'

class GameAndAuthors
   attr_reader :authors, :games

   def initialize
      base = "#{Dir.pwd}/saved_data"
      books_reader = File.read("#{base}/books.json")
      people_reader = File.read("#{base}/people.json")
      @authors = []
      @games = []
   end

   def list_authors
      if @authors.empty?
         puts 'No authors available'
      else
         @authors.each do |author|
            puts "#{author.first_name} #{author.last_name}"
         end
      end
   end

   def list_games
      if @games.empty?
         puts 'No games available'
      else
         @games.each do |game|
            puts "Published: #{game.publish_date}, Last-Played: #{game.last_played_at}, Multiplayer: #{game.multiplayer}"
         end
      end
   end

   def add_game
     print 'Publish date (format: yyyy-mm-dd): '
     pub_date = gets.chomp
     print "Multiplayer: "
     multi = gets.chomp
     print 'Date last played (format: yyyy-mm-dd): '
     last_date = gets.chomp
     puts 'Add the game author'
     create_author
     new_game = Game.new(Date.iso8601(pub_date), multi, Date.iso8601(last_date))
     new_game.add_author(@temp)
     @games << new_game
     puts 'Game created successfully'
   end
   
   private

   def create_author
     print 'First name: '
     f_name = gets.chomp
     print 'Last name: '
     l_name = gets.chomp
     new_author = Author.new(f_name, l_name)
     @authors << new_author
     @temp = new_author
   end
end
