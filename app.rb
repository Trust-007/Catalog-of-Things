require './games_and_authors/author_game'
require './games_and_authors/preserve_data'
require './music/user_input'

class App
  def initialize
    @author_game = GameAndAuthors.new
    @music_genre = MusicGenre.new
  end

  # menu_list provides a list of different options a user can select from
  def menu_list
    puts "\nWelcome to our Catalog app"
    puts "Please choose options below:
  1. List all books
  2. List all music albums
  3. List of games
  4. List all genres (e.g 'Comedy', 'Thriller')
  5. List all labels (e.g. 'Gift', 'New')
  6. List all authors (e.g. 'Stephen King')
  7. Add a book
  8. Add a music album
  9. Add a game
 10. Exit"
  end

  # this method calls specific method depending on the user selection
  def selection_cases
    loop do
      menu_list
      selection = input
      until (1..10).include? selection
        puts 'Wrong answer, please choose a number between 1-10: '
        selection = input
      end
      if selection == 10
        puts 'Thanks for using this app'
        # add your file save logic here
        write_data('authors', @author_game.authors)
        write_data('games', @author_game.games)
        break
      end
      menu_cases(selection)
    end
  end

  # add your methods here
  def menu_cases(selection)
    case selection
    when 2
      @music_genre.list_album
    when 3
      @author_game.list_games
    when 4
      @music_genre.list_genre
    when 6
      @author_game.list_authors
    when 8
      @music_genre.add_album
    when 9
      @author_game.add_game
    end
  end

  # ask user for input
  # @return the input
  def input
    gets.chomp.to_i
  end
end
