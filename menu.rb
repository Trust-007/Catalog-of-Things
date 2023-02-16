require './music/genre'
require './music/music_album'
require './music/preserve_data'
class Menu
  def initialize
    @read_genre = read_genre
    @genres = read_genre || []
    @read_albums = read_albums
    @music_albums = read_albums || []
  end

  def run
    select_contents
  end

  def contents
    "\nKindly choose a service:\n" \
      "1 - List all books \n" \
      "2 - List all music albums \n" \
      "3 - List all movies \n" \
      "4 - List of games \n" \
      "5 - List all genres \n" \
      "6 - List all labels \n" \
      "7 - List all authors \n" \
      "8 - List all sources \n" \
      "9 - Add a book \n" \
      "10 - Add a music album \n" \
      "11 - Add a movie \n" \
      "12 - Add a game \n" \
      "13 - Exit \n" \
  end

  def select_contents
    loop do
      puts contents
      choice = gets.chomp.to_i
      case choice
      when 2
        list_album
      when 5
        list_genre
      when 10
        add_album
      when 12
        'under construction'
      when 13
        library
        puts 'Thank for you using this app'
        return
      end
    end
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
    store_albums(@music_albums)

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
    id = @music_albums.count + 1
    puts 'Enter album published_date'
    publish_date = gets.chomp
    MusicAlbum.new(on_spotify, id, publish_date)
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
