require_relative "../../config/environment"
require_relative "./Countries.rb"
require_relative "./movies.rb"

class Scraper
    def run
        countries_scraper
    end

    def scrape_and_display_movies(user_input)
        movies_scraper(user_input)
        display_movies
    end

    def countries_scraper
        doc = Nokogiri::HTML(URI.open("https://www.imdb.com/calendar/?ref_=rlm&region=AU&type=MOVIE"))

        doc.css("select#country-selector option").each do |country|
            country_code = country.attr('value')
            country = country.text
            country_object = Countries.new(country_code, country)
        end
    end

    def movies_scraper(country_code)
        doc = Nokogiri::HTML(URI.open("https://www.imdb.com/calendar/?ref_=rlm&region=#{country_code}&type=MOVIE"))
        
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
            end
        end
    end

    def display_movies
        Movies.all.each do |movie|
            puts "--------------------------------"
            puts "TITLE: #{movie.movie_name}"
            puts "GENRES: #{movie.movie_genre}"
            puts "CASTS: #{movie.movie_casts}"
            puts "RELEASE DATE: #{movie.movie_release_date}"
            puts "--------------------------------"
        end
    end
end




