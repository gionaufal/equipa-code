class HomeController < ApplicationController
  def index
    @contracts = Contract.all
  end
end
