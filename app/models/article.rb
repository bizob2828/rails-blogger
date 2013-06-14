class Article < ActiveRecord::Base
   attr_accessible :title, :body, :tag_list
   has_many :comments
   has_many :taggings
   has_many :tags, through: :taggings

  def tag_list=(tags_string)
    names = tags_string.split(",").map{|s| s.strip.downcase}.uniq
    self.tags = names.map {|name| Tag.find_or_create_by_name(name) }
  end
end
