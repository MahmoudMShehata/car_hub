class CarFormsController < ApplicationController
  def show
    @car_form = CarForm.find(params[:id])
  end

  def new
    @car_form = CarForm.new
  end

  def create
    @car_form = CarForm.new(car_form_params)


    if @car_form.save
      @car_form.user = current_user
      redirect_to root_path
    else
      render :new
    end
  end

  def user_car_forms
    @car_forms = current_user.car_forms.includes(:quotations)
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
      :describe,
      :user_id
    )
  end
end
