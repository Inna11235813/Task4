require 'nokogiri'
require 'open-uri'


class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.last(10)
  end

  # POST /images
  # POST /images.json

 def create
   doc = Nokogiri::HTML(open('http://oboobs.ru'))
    images_html = doc.css('.dimage img')
    images_html.first(5).each do |image_html|
      url = image_html.attributes['src'].value
      image = Image.new
      image.picture_from_url url
      image.save
    end
  
    
    

     
    redirect_to images_url
  end
end
