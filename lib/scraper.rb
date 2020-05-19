#no "puts"
require 'pry'
class Scraper

  def initialize #(articles list)
    page = Nokogiri::HTML(HTTParty.get("https://www.vogue.com/fashion/trends").body)
    page.css(".feed-card").each do |artinfo|
      title = artinfo.css(" .feed-card--title a").text
      author = artinfo.css(".contributor-byline--name").text
      url = artinfo.css(" .feed-card--title a").attr("href").text
      Article.new(title, author, url)
    end
  end

    # binding.pry
    # page.css(".feed-page").each do |article|
    # end
  def scrape_article(article)
    article_page = Nokogiri::HTML(HTTParty.get(article.url))
    article.biopart1 = article_page.css("p")[2].text
    article.biopart2 = article_page.css("p")[3].text
    article.date = article_page.css(".content-header__publish-date").text
  end



  # def sc  rape_article
  # page.css("feed-page")
  # binding.pry
  # end
end