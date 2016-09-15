class ContractsController < ApplicationController
  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.save

    redirect_to @contract
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params

    params.require(:contract).permit(:customer_id, :equipment, :acquisition_price,
                                     :delivery_address, :responsable, :cpf,
                                     :rental_period, :initial_date, :amount,
                                     :discount, equipment_ids: [])
  end
end
