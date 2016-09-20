class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(params.require(:budget).permit(:name, :phone, :mail, :body))
    if @budget.save
      flash[:alert] = 'Sua mensagem foi enviada com sucesso. Aguarde nosso contato.'
      @budget = Budget.new
    else
      flash[:alert] = 'Não foi possível enviar o orçamento'
    end
    render :new
  end
end
