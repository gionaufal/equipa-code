class ReceiptsController <ApplicationController
  def new
    @receipt = Receipt.new
  end

  def show
    @receipt = Contract.find(params[:id]).receipt
  end

  def create
    contract = Contract.find(params[:id])
    contract.receipt = Receipt.create(address: contract.delivery_address,
                                      delivery_date: contract.initial_date)
    redirect_to receipt_contract_path(contract)
  end

end
