require('./menu')

def main
  puts 'Welcome to my Catalog of things'
  menu = Menu.new
  menu.run
end
main
