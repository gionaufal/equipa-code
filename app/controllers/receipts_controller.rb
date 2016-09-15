class ReceiptsController <ApplicationController
  def new
    @receipt = Receipt.new
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def create
    contract = Contract.find(params[:id])
    contract.receipt = Receipt.create(address: contract.delivery_address,
                                      delivery_date: contract.initial_date)
    redirect_to contract.receipt
  end

end
