#responsible for communication with the user
#puts a lot
#invokes scraper class
#not using noku (for scraping)
require 'pry'
class Cli

  def call
    Scraper.new
    puts "Welcome fashionista/o!"
    puts "Here you can stay up to date with all the latest fashion trends."
    #start
  end

  def start
    article_list
    puts "Choose an article by typing the article ID number it is associated with."
    puts "If you would like to exit, type 'exit'"
    input = gets.strip.downcase
    if input == "exit"
      puts "thanks for browsing, see you later!"
      exit
    elsif


  end

  def article_list
    puts "Current Articles:"
    Article.all.map do |art|
      puts "* Article ID: #{art.id}"
      puts "* Name: #{art.title}"
      puts "* Author: #{art.author}"
      puts "*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*"
    end
  end

  def make_selection
    puts"

end

