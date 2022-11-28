class Movies
    attr_accessor :movie_name, :movie_genre, :movie_casts, :release_date

    @@all = []

    def initialize(name, genre, casts, release_date)
        @name = name
        @genre = genre
        @casts = casts
        @release_date = release_date
        @@all << self
    end

    def self.all
        @@all
    end
end