#blueprint of object (Fashion show)
#no puts, just stores instances of data i.e. attributes

class Article
  attr_accessor :title, :author, :url, :date, :bio, :id

  @@all = []
  @@current_id = 1

  def initialize(title = nil, author = nil, url = nil, date = nil, bio = nil)
    @title = title
    @author = author
    @url = url
    @date = date
    @bio = bio
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
