require_relative "../../config/environment"

# class JobScraper::Scraper

    def get_page
        doc = Nokogiri::HTML(URI.open('https://www.eventcinemas.com.au/Movies/ComingSoon'))

        binding.pry
    end

    # def scrape_jobs
    #     get_page.css("div.yvsb870 a._1tmgvw5._1tmgvw7._1tmgvwa._1tmgvwb._1tmgvwe.yvsb870.yvsb87f._14uh994h")
# end

get_page
