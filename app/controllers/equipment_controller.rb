class EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
    @categories = Category.all
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to @equipment
    else
      flash[:error] = 'Todos os campos são obrigatórios'
      render :new
    end
  end

  def show
    @equipment = Equipment.find params[:id]
  end

  private

  def equipment_params
    params.require(:equipment).permit(
      :category_id, :model, :serial_number, :asset_number, :acquisition_price
    )
  end
end
