class ContractsController < ApplicationController
  before_action :equipment_with_price, only: [:new, :create]
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    @equipment_with_price = Equipment.joins(category: :prices).distinct
    if @contract.save
      redirect_to @contract
    else
      flash[:error] = 'Você não preencheu alguns campos necessários.'
      render :new
    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params
    params.require(:contract).permit(:customer_id, :equipment,
                                     :acquisition_price, :delivery_address,
                                     :responsable, :cpf, :rental_period,
                                     :initial_date, :amount, :discount,
                                     equipment_ids: [])
  end

  def equipment_with_price
    @equipment_with_price = Equipment.joins(category: :prices).distinct
  end

end
