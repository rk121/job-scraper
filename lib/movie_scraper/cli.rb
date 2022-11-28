require_relative "./scraper.rb"

run_code = CommandLineInterface.new

run_code.run

puts "WELCOME"
puts "To start please select your country code from the list below:"

Countries.all.each do |country|
    puts "#{country.country}: #{country.country_code}" if country.country_code != ""
end

user_input = gets.chomp.upcase

while !Countries.all.any? {|country| country.country_code == user_input} 
    puts "Oh noo, looks like that country code is currently unavailable"
    user_input = gets.chomp.upcase
end

# CommandLineInterface.country_code = user_input
puts "You have selected: #{user_input}"

puts "--------------------------------------------------"
puts "                   MOVIES                         "
puts "--------------------------------------------------"

run_code.scrape_and_display_movies(user_input)
