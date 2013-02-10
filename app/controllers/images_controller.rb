require 'nokogiri'
require 'open-uri'

class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])
  end

  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
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

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])

    if @image.update_attributes(params[:image])
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_url
  end
end
