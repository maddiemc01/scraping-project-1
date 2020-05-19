#no "puts"
require 'pry'
class Scraper

  def initialize #(articles list)
    page = Nokogiri::HTML(HTTParty.get("https://www.vogue.com/fashion/trends"))
    page.css(".feed-card").each do |artinfo|
      title = artinfo.css(" .feed-card--title a").text
      author = artinfo.css(".contributor-byline--name").text
      url = artinfo.css(" .feed-card--title a").attr("href").text
      Article.new(title, author)
    end
  end

    # binding.pry
    # page.css(".feed-page").each do |article|
    # end
  def scrape_article(article)
    article_page = Nokogiri::HTML(HTTParty.get(article.url))
    article.bio = article_page.css(".body gallery__intro__body p")
    article.date = article_page.css(".content-header__publish-date")
    binding.pry
  end




  # def sc  rape_article
  # page.css("feed-page")
  # binding.pry
  # end
end