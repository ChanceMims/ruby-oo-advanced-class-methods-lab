require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  # def initialize(name)
  #   @name = name
  # end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
   # binding.pry
    @@all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) ? find_by_name(song_name) : create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    song_and_artist_pair = file.chomp('.mp3').split(' - ' )
    song = self.new
    song.artist_name = song_and_artist_pair[0]
    song.name = song_and_artist_pair[1]
    song
  end

def self.create_from_filename(file)
  song = new_from_filename(file)
  song.save
  song
  
end

def self.destroy_all
  @@all.clear
end

end
