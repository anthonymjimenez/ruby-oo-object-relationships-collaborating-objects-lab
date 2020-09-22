class Song

    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def self.new_by_filename(song)
        new_song = Song.new(song.split('-')[1].strip)
        new_song.artist = Artist.find_or_create_by_name(song.split('-')[0].strip)
        new_song
    end

    def artist_name=(artist)
        self.artist = Artist.find_or_create_by_name(artist)
    end


end
