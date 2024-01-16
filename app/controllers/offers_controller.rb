require 'mechanize'
require 'nokogiri'
class OffersController < ApplicationController
  before_action :authenticate_user!

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    link = params[:offer][:link]
    offer_data = parse_offer(link)
    @offer = Offer.new(offer_data)

  if @offer.save
    redirect_to offer_path(@offer), notice: 'Offer successfully saved!'
  else
    flash.now[:alert] = "Error: Offer could not be created."

    render :new, status: :unprocessable_entity
  end
  end

  private

  def parse_offer(url)
    agent = Mechanize.new
    page = agent.get(url)

    title = page.at('div.title-text').text.strip
    images = page.search('img.detailgallery-image').map { |img| img['src'] }
    description = page.at('div.detail-description-content').text.strip
    rating = page.at('span.title-info-number').text.strip.to_i
    price = page.at('span.price-text').text.strip.to_f
    options = page.search('div.prop-item-wrapper div.prop-item').map do |opt|
      image = opt.at('div.prop-img img')['src']
      name = opt.at('div.prop-name').text.strip
      { image: image, name: name }
    end

    {
      title: title,
      images: images,
      description: description,
      rating: rating,
      price: price,
      options: options
    }
  end
end
