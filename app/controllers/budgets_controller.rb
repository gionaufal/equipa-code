class BudgetsController < ApplicationController

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.create(params.require(:budget).permit(:name, :phone, :mail, :body))
    flash[:alert] = 'Sua mensagem foi enviada com sucesso. Aguarde nosso contato.'
    @budget = Budget.new
    render :new
  end

end
