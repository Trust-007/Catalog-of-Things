require_relative 'genre'
require_relative 'music_album'
require_relative 'preserve_data'

class MusicGenre
  def initialize
    @read_genre = read_genre
    @genres = read_genre || []
    @read_albums = read_albums
    @music_albums = read_albums || []
  end

  def list_genre
    @genres.each do |genre|
      puts "genre ID: #{genre.id}"
      puts "Genre Name: #{genre.name}"
    end
  end

  def add_album
    on_spotify = ask_on_spotify
    if on_spotify.nil?
      puts 'invalid value'
      return
    end

    album = create_album(on_spotify)
    genre = ask_genre
    music_album = { 'album' => album, 'genre' => genre }

    add_to_genre(album, genre)
    add_to_music_albums(music_album)
    library

    puts 'Album created successfully'
  end

  def ask_on_spotify
    puts 'Is it on Spotify?[y/n]'
    case gets.chomp
    when 'y'
      true
    when 'n'
      false
    end
  end

  def create_album(on_spotify)
    puts 'Enter album published_date'
    publish_date = gets.chomp
    MusicAlbum.new(on_spotify, publish_date)
  end

  def ask_genre
    puts 'Enter genre of music album'
    gets.chomp
  end

  def add_to_genre(album, genre)
    new_genre = Genre.new(genre)
    new_genre.add_item(album)
    @genres << new_genre
  end

  def add_to_music_albums(music_album)
    @music_albums << music_album
  end

  def list_album
    @music_albums.each do |album|
      puts "on_spotify: #{album['album'].on_spotify},
       id: #{album['album'].id},
        publish_date: #{album['album'].publish_date}"
    end
  end

  def library
    store_albums(@music_albums)
    store_genre(@genres)
  end
end
