class PricesController < ApplicationController

  def index
    @categories = Category.all
  end

end
