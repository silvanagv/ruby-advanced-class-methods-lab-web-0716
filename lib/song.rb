class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    @@all[-1]
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      song = self.new
      song.name = name
      @@all << song
      song
    end
  end

  def self.alphabetical
    array = []
    song_names = self.all.collect do |song|
      song.name
    end
    song_names = song_names.sort
    new_array = []

    song_names.each do |name|
      self.all.each do |song|
        if name == song.name
          new_array << song
        end
      end
    end
    new_array

  end

  def self.new_from_filename(filename)
    song = self.new
    removed_extension = filename.split(".")
    removed_extension = removed_extension[0].split(" - ")
    song.artist_name = removed_extension[0]
    song.name = removed_extension[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    removed_extension = filename.split(".")
    removed_extension = removed_extension[0].split(" - ")
    song.artist_name = removed_extension[0]
    song.name = removed_extension[1]
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

end
