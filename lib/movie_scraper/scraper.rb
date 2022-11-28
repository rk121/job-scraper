require_relative "../../config/environment"

# class JobScraper::Scraper

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

    def get_page
        doc = Nokogiri::HTML(URI.open('https://www.imdb.com/calendar/?ref_=rlm&region=AU&type=MOVIE'))

        parsed_data = doc.css(".ipc-page-section")

        doc.css("article.sc-f56042d2-1").each do |releasing_date|
            release_date = releasing_date.css(".ipc-title__text").text

            releasing_date.css("ul.ipc-metadata-list").css(".ipc-metadata-list-summary-item").each do |movie|
                movie_title = movie.css("a.ipc-metadata-list-summary-item__t").text
                movie_genre = []
                movie.css("ul.ipc-metadata-list-summary-item__tl").each do |genre|
                    genre_parsed = genre.css("li label.ipc-metadata-list-summary-item__li").text.split /(?=[A-Z])/
                    movie_genre = genre_parsed
                end
                movie_casts = []
                movie.css("ul.ipc-metadata-list-summary-item__stl").each do |cast|
                    cast_parsed = cast.css("label.ipc-metadata-list-summary-item__li").text.split(/(?<!\s)(?=[A-Z])/)
                    movie_casts = cast_parsed
                end

                movie = Movies.new(movie_title, movie_genre, movie_casts, release_date)

                puts movie_title
                puts movie_genre
                p movie_casts
                binding.pry
            end
            binding.pry
        end
    end

    # def scrape_jobs
    #     get_page.css("div.yvsb870 a._1tmgvw5._1tmgvw7._1tmgvwa._1tmgvwb._1tmgvwe.yvsb870.yvsb87f._14uh994h")
# end

# doc.css(".ipc-page-section").first.css("ul.ipc-metadata-list").first

get_page


