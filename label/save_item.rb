require 'json'

def save_item(item)
  file = File.open('saved_data/labels.json', 'r')
  data = file.read
  parsed_data = JSON.parse(data)
  puts parsed_data
  parsed_data << item
  File.write('saved_data/labels.json', JSON.pretty_generate(parsed_data))
end
