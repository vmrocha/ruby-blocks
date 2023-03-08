class Song
  EXTENSIONS = [".mp3", ".wav", ".acc"]

  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end

  def each_filename
    basename = "#{name}-#{artist}".gsub(" ", "-").downcase
    EXTENSIONS.each { |ext| yield basename + ext }
  end
end

song1 = Song.new("Bicylops", "Fleck", 260)
song2 = Song.new("The Calling", "Santana", 468)
song3 = Song.new("Another One", "Santana", 123)
song4 = Song.new("Dancing Queen", "ABBA", 423)

class Playlist
  include Enumerable

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def each
    @songs.each do |song|
      # puts "Yielding #{song.name}..."
      yield song
    end
  end

  def play_songs
    each { |song| song.play }
  end

  def each_tagline
    each { |song| yield "#{song.name} - #{song.artist}" }
  end

  def each_by_artist(artist)
    select { |s| s.artist == artist }.each { |song| yield song }
  end
    
end

playlist = Playlist.new("My Playlist")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)
playlist.add_song(song4)

playlist.each { |song| song.play }

playlist.play_songs

ing_songs = playlist.select { |song| song.name =~ /ing/ }
p ing_songs

playlist.each_tagline { |tagline| puts tagline }

playlist.each_by_artist("Santana") { |song| song.play }

song1.each_filename { |filename| puts filename }