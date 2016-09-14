class EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
    @categories = Category.all
  end

  def create
    @equipment = Equipment.create(equipment_params)
    redirect_to @equipment
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
