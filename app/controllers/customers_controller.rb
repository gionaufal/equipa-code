class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params.require(:customer).permit(:name, :billing_address, :mail, :phone, :cnpj))
    if @customer.save
      redirect_to @customer
    else
      flash[:error] = 'Você precisa preencher todos os campos!'
      render :new
    end
  end
end
