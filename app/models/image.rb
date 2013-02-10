require "open-uri"

class Image < ActiveRecord::Base
  attr_accessible :image
    has_attached_file :image

  def self.convert_options
    "composite label:'welcom'"
  end
  
  def picture_from_url(url)
     self.image = open(url)
  end
end
