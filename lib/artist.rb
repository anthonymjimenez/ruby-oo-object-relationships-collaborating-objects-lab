class Artist 
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def songs 
        Song.all.find_all { | songObj| 
        songObj.artist == self
    }
    end

    def print_songs
        songs.map { |songObj| puts songObj.name }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        artist = @@all.find { |artistObj|  artistObj.name == artist_name}
        artist ? artist : Artist.new(artist_name)
    end

 end
