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

  def comment
    @car_form = CarForm.find(params[:car_form_id])
    @comment = @car_form.comments.build(content: params[:quotation][:comments][:content])

    if @comment.save
      redirect_to @car_form
    else
      # Handle errors
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

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
