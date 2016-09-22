class HomeController < ApplicationController
  def index
    @contracts = Contract.order(return_date: :asc)
  end
end
