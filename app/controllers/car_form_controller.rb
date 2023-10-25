class CarFormController < ApplicationController
  def new
    @car_form = CarForm.new
  end

  def create
    @car_form = CarForm.new(car_form_params)

    if @car_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def car_form_params
    params.require(:car_form).permit(
      :city,
      :address,
      :phone_number,
      :email,
      :vehicle_type,
      :vehicle_identification_number,
      :describe
    )
  end
end
