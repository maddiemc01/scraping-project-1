#blueprint of object (Fashion show)
#no puts, just stores instances of data i.e. attributes

class Article
  attr_accessor :title, :author, :url, :date, :biopart1, :biopart2, :id

  @@all = []
  @@current_id = 1

  def initialize(title = nil, author = nil, url = nil)
    @title = title
    @author = author
    @url = url
    @date
    @id = @@current_id
    @@all << self
    @@current_id += 1
  end

  def self.all
    @@all
  end

  def self.find_by_id(id)
    all.find { |article| article.id == id }
  end

end
