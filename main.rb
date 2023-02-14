require('./menu')

def main
  # rubocop:disable Metrics/MethodLength
  puts 'Welcome to my Catalog of things'
  flag = true
  while flag
    puts menu
    choice = gets.chomp
    case choice
    when '1'
      puts 'Book list coming soon'
    when '2'
      puts 'Music albums coming soon'
    when '3'
      puts 'Movies coming soon'
    when '4'
      puts 'Games coming soon'
    when '5'
      puts 'All genres coming soon'
    when '6'
      puts 'All labels comming soon'
    when '7'
      puts 'All others coming soon'
    when '8'
      puts 'All sources will be here'
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
  # rubocop:enable Metrics/MethodLength
end

main
