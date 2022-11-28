class Movies
    attr_accessor :movie_name, :movie_genre, :movie_casts, :movie_release_date

    @@all = []

    def initialize(name, genre, casts, release_date)
        @movie_name = name
        @movie_genre = genre
        @movie_casts = casts
        @movie_release_date = release_date
        @@all << self
    end

    def self.all
        @@all
    end
end