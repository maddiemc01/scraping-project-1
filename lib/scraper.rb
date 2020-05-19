#no "puts"
require 'pry'
class Scraper

  def initialize
    page = Nokogiri::HTML(HTTParty.get("https://www.vogue.com/fashion/trends"))
  end

    # binding.pry
    # page.css(".feed-page").each do |article|
    # end
def scrape_articles
    page.css(".feed-card").each do |artinfo|
      binding.pry
      title = artinfo.css(" .feed-card--title a").text
      author = artinfo.css(".contributor-byline--name").text
      link = artinfo.css(" .feed-card--title a").attr("href")
    end

    def scrape_bio

  end


  # def scrape_article
  # page.css("feed-page")
  # binding.pry
  # end
end