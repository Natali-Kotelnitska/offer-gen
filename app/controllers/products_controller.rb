class ProductsController < ApplicationController
  before_action :authenticate_user!
  def show
    @url = params[:url]
    scraping_service = ScrapingService.new(@url)
    @scraped_data = scraping_service.scrape_data
  end
end
