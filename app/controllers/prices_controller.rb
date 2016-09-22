class PricesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @days = RentalPeriod::DAYS
    @categories = Category.all
    @price = Price.new
  end

end
