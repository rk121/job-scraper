require_relative "./scraper.rb"

user_input = nil

while user_input != "N" do
    run_code = Scraper.new

    run_code.run

    puts "--------------------------------------------------"
    puts "                UPCOMING MOVIE                    "
    puts "--------------------------------------------------"
    puts "To start please select your country code from the list below:"

    Countries.all.each do |country|
        puts "#{country.country}: #{country.country_code}" if country.country_code != ""
    end

    user_input = gets.chomp.upcase

    while !Countries.all.any? {|country| country.country_code == user_input} 
        puts "Oh noo, looks like that country code is currently unavailable"
        user_input = gets.chomp.upcase
    end

    puts "You have selected: #{user_input}"

    puts "--------------------------------------------------"
    puts "                   MOVIES                         "
    puts "--------------------------------------------------"

    run_code.scrape_and_display_movies(user_input)

    puts "What would you like to do next?"
    puts "To exit the program, please type \"n\""
    puts "To search for movies in any other country, please enter any other key"
    user_input = gets.chomp.upcase
end
