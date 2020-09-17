class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        file_array = Dir.entries(@path)
        file_array.delete_if { |file_name| file_name == "." || file_name == ".."}
        file_array
    end

    def import
        self.files.each {|song| Song.new_by_filename(song)}
    end


end

