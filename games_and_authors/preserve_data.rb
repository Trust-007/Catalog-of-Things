require 'fileutils'
require 'json'

FileUtils.mkdir_p('saved_data')
base = "#{Dir.pwd}/saved_data"
File.open("#{base}/games.json", 'w') unless File.exist?("#{base}/games.json")
File.open("#{base}/authors.json", 'w') unless File.exist?("#{base}/authors.json")

def write_data(filename, array)
  case filename
  when 'games'
    write_games(array)
  when 'authors'
    write_authors(array)
  else
    puts 'Error!'
  end
end

def write_games(array)
  base = "#{Dir.pwd}/saved_data"
  empty_array = []
  array.each { |e| empty_array.push({ publish_date: e.publish_date, multiplayer: e.multiplayer, last_played_at: e.last_played_at }) }
  File.write("#{base}/games.json", empty_array.to_json, mode: 'w')
end

def write_authors(array)
  base = "#{Dir.pwd}/saved_data"
  empty_array = []
  array.each { |e| empty_array.push({ first_name: e.first_name, last_name: e.last_name }) }
  File.write("#{base}/authors.json", empty_array.to_json, mode: 'w')
end