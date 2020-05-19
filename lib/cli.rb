#responsible for communication with the user
#puts a lot
#invokes scraper class
#not using noku (for scraping)
require 'pry'
class Cli

  def call
  puts "Welcome fashionista/o! We have a list of articles that has all the latest fashion trends. Please select an article, 1-9, to get more details."
  puts "1 represents the most recent article, 9 reprsents the oldest"
    Scraper.new
  end

end

