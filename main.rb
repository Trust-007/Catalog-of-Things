require('./menu')
require './games_and_authors/author_game'
require './games_and_authors/preserve_data'

def main
  puts 'Welcome to my Catalog of things'
  menu = Menu.new
  # menu.run
  author_game = GameAndAuthors.new
  flag = true
  while flag
    puts menu
    choice = gets.chomp
    case choice
    when '4'
      author_game.list_games
    when '7'
      author_game.list_authors
    when '12'
      author_game.add_game
    when '13'
      puts 'Thank for you using this app'
      flag = false
    end
  end
  write_data('authors', author_game.authors)
  write_data('games', author_game.games)
end
main
