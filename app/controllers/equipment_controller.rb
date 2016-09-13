class EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
  end
end
