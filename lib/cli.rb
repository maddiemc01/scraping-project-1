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
    start
  end

  def start
    article_list
    while true do
      puts "Choose an article by typing the article ID number it is associated with."
      puts "If you would like to exit, type 'exit'"
      input = gets.strip.downcase
      if input == "exit"
        puts "Thanks for browsing, see you later!"
        exit
      elsif input.to_i <=0 || input.to_i > Article.all.count
        binding.pry
        puts "Sorry, there is currntly no article associated with that ID, try entering a different ID:"
      elsif input
        article = Article.find_by_id(input.to_i)
        Scraper.new.scrape_article(article)
        puts "#{article.title} was written on #{article.date}."
        puts "Here's a quick abstract: '#{article.bio}'"
        puts "if interested in the full article, visit: #{article.url}"
      end
    end
  end

  def article_list
    puts "Current Articles to Explore:"
    Article.all.map do |art|
      puts "* Article ID: #{art.id}"
      puts "* Name: #{art.title}"
      puts "* Author: #{art.author}"
      puts "*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*"
    end
  end

end

