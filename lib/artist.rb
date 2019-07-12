require 'pry'
class Artist
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
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
    artist = Artist.new(name) 
    artist.save 
    artist
  end
  
  def songs
    @songs 
  end 
  
  def add_song(obj)
        self.songs << obj if self.songs.detect {|song| song == obj}.nil?
        obj.artist = self if obj.artist.nil?
    end 
    
    def genres
        self.songs.collect {|song| song.genre}.uniq
    end
end 