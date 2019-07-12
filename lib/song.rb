class Song 
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(name)
    song = Song.new(name) 
    song.save 
    song
  end
  
  def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end
    
    def self.new_from_filename(file_name)
        artist_name, song_name, song_genre = file_name.split(" - ")
        song_genre = song_genre.gsub(".mp3", "")

        song = find_or_create_by_name(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song.genre = Genre.find_or_create_by_name(song_genre)

        song
    end

    def self.create_from_filename(file_name)
        song = new_from_filename(file_name)
        song.save
    end
end 