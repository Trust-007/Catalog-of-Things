require('./menu')

def main
  puts 'Welcome to my Catalog of things'
  flag = true
  while flag
    puts menu
    choice = gets.chomp
    case choice
    when '9'
      puts 'You cannot add a book now'
    when '10'
      puts 'Music system under maientance'
    when '11'
      puts 'Movie system coming soon'
    when '12'
      puts 'Game section is out of service'
    when '13'
      puts 'Thank for you using this app'
      flag = false
    end
  end
end
main
