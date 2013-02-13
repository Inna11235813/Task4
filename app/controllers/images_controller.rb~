require 'nokogiri'
require 'open-uri'
require 'RMagic'

class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.last(10)
  end

  # POST /images
  # POST /images.json
=begin
 def create
   doc = Nokogiri::HTML(open('http://oboobs.ru'))
    images_html = doc.css('.dimage img')
    images_html.first(5).each do |image_html|
      url = image_html.attributes['src'].value
      image = Image.new
      image.picture_from_url url
      image.save
    end
=end    
    
    
=begin
 def create
 ranks = text.scan (%r{<dev id = "divrank[\d]{4}">(.*)</div>}).flatten
 links = text.scan(%r{img src="(.*)?" alt = ".*obbobs.ru.*\/>"}).flatten
 for i in 0..5
 image = Magic::Image.read(links[i].first)
 title= Draw.new
 title.annotate(image,0,0,0,30,ranks[i])
 {
  self.fill='white'
  self.stroke = 'transparent'
  self.pointsize = 24
  self.font_weight = Boldweight
  self.gravity = SouthGravity
 }
 image.write("app/assets/images/#{i}.ipg")
=end

  doc = Nokogiri::HTML(open('http://oboobs.ru'))
    images_html = doc.css(' .dimage img')
    images_html.first(5).each do |image_html|
    url = image_html.attributes['src'].value
    
    text = doc.read
      ranks = text.scan (%r{<dev id = "divrank[\d]{4}">(.*)</div>}).flatten

 for i in 0..5
 image = Magic::Image.read(links[i].first)
 title= Draw.new
 title.annotate(image,0,0,0,30,ranks[i])
 {
  self.fill='white'
  self.stroke = 'transparent'
  self.pointsize = 24
  self.font_weight = Boldweight
  self.gravity = SouthGravity
 }
    
    image = Image.new
    image.picture_from_url url
    image.save
    end

     
    redirect_to images_url
  end
end
