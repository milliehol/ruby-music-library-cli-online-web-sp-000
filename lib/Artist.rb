class Artist

  attr_accessor :name, :artist, :genre


  @@all = []


  def initialize(name, artist=nil, genre=nil)
   @name = name
   @songs = []
   self.artist=(artist) if artist != nil
   self.genre=(genre) if genre != nil
 end

  def self.all
    @@all
  end

  def self.create(name)
     name = self.new(name)
     self.all << name
     name
   end

  def self.new_by_name(title)
   song = self.new
   song.name = title
   song
  end

  def save
    self.class.all << self
  end


  def self.destroy_all
    self.all.clear
  end


def songs
  Song.all.select {|song| song.artist == self}
end

def add_song(song)
  @songs << song
  song.artist = self
  @@song_count += 1
end

def add_song_by_name(name)
 song = Song.new(name)
 @songs << song
 song.artist = self
 @@song_count += 2
end


end
