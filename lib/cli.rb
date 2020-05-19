require "pry"
# responsible for communication with the user
# puts a lot
# invokes scraper class
# not using noku (for scraping)

class Cli
  def call
    Scraper.new
    puts "Welcome fashionista/fashionisto!"
    puts "Here you can stay up to date with all the latest fashion trends."
    start
  end

  def start
    list
    print "Choose an article by entering the article ID number"
    puts " it is associated with."
    loop do
      puts "If you would like to exit, type 'exit'"
      conditional
    end
  end

  def list
    puts "Current Articles to Explore:"
    Article.all.map do |art|
      puts "* Article ID: #{art.id}"
      puts "* Title: #{art.title}"
      puts "* Author: #{art.author}"
      puts "*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*~~*"
    end
  end

  def conditional
    input = gets.strip.downcase
    if input == "exit"
      ex
    elsif input.to_i <= 0 || input.to_i > Article.all.count
      error
    elsif input
      info(input)
    end
  end

  def ex
    puts "Thanks for browsing, see you later!"
    exit
  end

  def error
    print "Sorry, there is currently no article associated with that ID,"
    puts " try entering a different ID:"
  end

  def info(input)
    article = Article.find_by_id(input.to_i)
    Scraper.new.scrape_article(article)
    info_layout(article)
  end

  def info_layout(article)
    print "You have chosen '#{article.title}', written on #{article.date}."
    puts ""
    print "To give you an idea of what this article is about,"
    puts " here is an abstract:"
    puts "    #{article.biopart1}"
    puts "    #{article.biopart2}"
    puts "If interested in the full article, visit: #{article.url}"
    puts ""
    print "If you'd like to look at a different article,"
    puts " enter that article's ID number."
  end
end
