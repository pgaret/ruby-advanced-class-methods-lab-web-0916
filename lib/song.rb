class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = ""
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    @@all.last
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by!{|song| song.name}
  end

  def self.new_from_filename(input)
    song = Song.new_by_name(input.split(" - ").last[0..-5])
    song.artist_name = input.split(" - ").first
    song
  end

  def self.create_from_filename(input)
    @@all << Song.new_from_filename(input)
  end

  def self.destroy_all
    @@all = []
  end

end
