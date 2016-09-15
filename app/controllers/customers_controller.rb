class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.create(params.require(:customer).permit(:name, :billing_address, :mail, :phone, :cnpj))
    redirect_to customer
  end
end
