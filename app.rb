require './games_and_authors/author_game'
require './games_and_authors/preserve_data'

class App

  def initialize
        author_game = GameAndAuthors.new
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

  # this method calls specifc method depending on the user selection
  def selection_cases
    cases = menu_cases
    loop do
      menu_list
      selection = input
      until (1..10).include? selection
        puts 'Wrong answer, please choose a number between 1-10: '
        selection = input
      end
      method = cases[selection]
      if method == :exit
        puts 'Thanks for using this app'
        write_data('authors', author_game.authors)
        write_data('games', author_game.games)
        break
      end
      send(method)
    end
  end

  def menu_cases
    {
      1 => 'list books',
      2 => 'list music',
      3 => author_game.list_games,
      4 => 'list genre',
      5 => 'list labels',
      6 => author_game.list_authors,
      7 => 'add book',
      8 => 'add music_album',
      9 => authoradd_game,
      10 => :exit
    }
  end

  # ask user for input
  # @return the input
  def input
    gets.chomp.to_i
  end
end

