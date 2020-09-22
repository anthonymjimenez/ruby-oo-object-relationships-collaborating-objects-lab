class MP3Importer

    attr_accessor :path

    @@all = []

    def initialize(file_path)
        @path = file_path
        @@all.push(self)
    end

    def files
        Dir.children(@path)
    end

    def import
        files.map { |element| Song.new_by_filename(element)}
    end

    end