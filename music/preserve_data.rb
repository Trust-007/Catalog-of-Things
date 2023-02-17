require 'json'
# Write
def store_albums(music_albums)
  File.write('music_album.json', JSON.pretty_generate(music_albums.map do |album|
    { on_spotify: album['album'].on_spotify,
      publish_date: album['album'].publish_date,
      genre: album['genre'] }
  end))
end

def store_genre(genres)
  File.write('genre.json', JSON.pretty_generate(genres.map { |genre| { id: genre.id, name: genre.name } }))
end

# Read
def read_albums
  return [] unless File.exist?('music_album.json')

  JSON.parse(File.read('music_album.json')).map do |album|
    {
      'album' => MusicAlbum.new(album['on_spotify'], album['publish_date']),
      'genre' => album['genre']
    }
  end
end

def read_genre
  return [] unless File.exist?('genre.json')

  JSON.parse(File.read('genre.json')).map do |genre|
    Genre.new(genre['name'])
  end
end
