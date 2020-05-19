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
      puts "Choose an article by entering the article ID number it is associated with."
      while true do
      puts "If you would like to exit, type 'exit'"
      input = gets.strip.downcase
      if input == "exit"
        puts "Thanks for browsing, see you later!"
        exit
      elsif input.to_i <=0 || input.to_i > Article.all.count
        puts "Sorry, there is currently no article associated with that ID, try entering a different ID:"
      elsif input
        article = Article.find_by_id(input.to_i)
        Scraper.new.scrape_article(article)
        puts "You've chosen '#{article.title}', which was written on #{article.date}."
        puts ""
        puts "To give you an idea of what this article is about, here's an abstract:"
        puts "    #{article.biopart1}"
        puts "    #{article.biopart2}"
        puts "If interested in the full article, visit: #{article.url}"
        puts ""
        puts "If you'd like to look at a different article, enter that article's ID number."
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

