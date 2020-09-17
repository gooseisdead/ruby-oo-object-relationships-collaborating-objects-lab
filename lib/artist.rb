class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def songs
        @songs
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_by_name(name)
        @@all.find {|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        artist = @@all.find{|artist| artist.name == name}
        if(!artist)
            artist = Artist.new(name)
        end
        artist
    end

    def print_songs
        @songs.each do |song|
            puts "#{song.name}"
        end
    end
end 

# class Artist
#     @@all = []
#     attr_accessor :name, :songs
  
#     def initialize(name)
#       @name = name
#       @songs = []
#       save
#     end
  
#     def self.all
#       @@all    
#     end


#     def add_song(song)
#         song.artist = self
#     end
  
#     # def add_song(song)
#     #   @songs << song
#     #   song.artist = self
#     # end
  
#     def songs
#       Song.all.select {|song| song.artist == self}
#     end

#     def self.find_or_create_by_name(name)
#         self.find(name) ? self.find(name) : self.create(name)
#         self.find(name) ? self.find(name) : self.new(name)
#     end
    
#     def self.find(name)
#         self.all.find {|artist| artist.name == name }
#     end
    
    
#     def self.create(name)
#         self.new(name).tap {|artist| artist.save}
#     end
    
#     def save
#         @@all << self
#     end


#   def print_songs
#     songs.each {|song| puts song.name}
#   end

# end