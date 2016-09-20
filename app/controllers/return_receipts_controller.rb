class ReturnReceiptsController < ApplicationController
  before_action :find_contract
  def new
    @return_receipt = @contract.build_return_receipt
  end

  def create
    @return_receipt = @contract.build_return_receipt(params
        .require(:return_receipt)
        .permit(:employee_name, :cpf))
    if @return_receipt.save
      redirect_to [@contract, @contract.return_receipt]
    else
      flash[:error] = 'Preencha os dados do funcionário'
      @return_receipt = @contract.build_return_receipt
      render :new
    end
  end

  def show
  end

  private

  def find_contract
    @contract = Contract.find(params[:contract_id])
  end
end
