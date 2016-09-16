class ReturnReceiptsController < ApplicationController
  before_action :find_contract
  def new
    @return_receipt = @contract.build_return_receipt
  end

  def create
    @contract.return_receipt = ReturnReceipt.new(params.require(:return_receipt)
                      .permit(:employee_name, :cpf))
    if @contract.return_receipt.save
      redirect_to [@contract, @contract.return_receipt]
    else
      flash[:error] = 'Preencha os dados do funcionário'
      @contract.return_receipt = ReturnReceipt.new
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
