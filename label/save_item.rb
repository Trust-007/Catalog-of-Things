require 'json'

def save_item(item)
  file = File.open('saved_data/labels.json', 'r')
  data = file.read
  parsed_data = JSON.parse(data)
  puts parsed_data
  parsed_data << item
  File.write('saved_data/labels.json', JSON.pretty_generate(parsed_data))
end

def save_book(array)
  base = "#{Dir.pwd}/saved_data"
  book_array = []
  array.each do |e|
    book_array.push({ publish_date: e.publish_date, cover_state: e.cover_state })
  end
  File.write("#{base}/books.json", book_array.to_json, mode: 'w')
end

def save_label(array)
  base = "#{Dir.pwd}/saved_data"
  label_array = []
  array.each do |e|
    label_array.push({ title: e.title, color: e.color })
  end
  File.write("#{base}/labels.json", label_array.to_json, mode: 'w')
end
