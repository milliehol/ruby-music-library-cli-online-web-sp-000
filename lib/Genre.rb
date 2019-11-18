class Genre

  attr_accessor :name, :artist, :genre


  @@all = []


  def initialize(name, artist=nil, genre=nil)
   @name = name
   self.artist=(artist) if artist != nil
   self.genre=(genre) if genre != nil
   @songs = []
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

  def self.create_by_name(title)
   song = self.create
   song.name = title
   song
  end

  def self.find_by_name(title)
      result = self.all.detect {|song| song.name == title}
      result
    end

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def save
    self.class.all << self
  end


  def self.destroy_all
    self.all.clear
  end


end
