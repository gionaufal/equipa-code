class PricesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @days = RentalPeriod::DAYS
    @categories = Category.all
    if params[:category_id]
      @price = Price.new(category_id: params[:category_id], days: params[:days], price: params[:price])
    else
      @price = Price.new
    end
  end

  def create
    @price = Price.new(params.require(:price).permit(:days, :category_id, :price))
    if @price.save
      redirect_to prices_path
    else
      flash[:error] = 'Todos os campos são obrigatórios'
      render :new
    end
  end

end
