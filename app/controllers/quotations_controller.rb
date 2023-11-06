class QuotationsController < ApplicationController
  #before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  def index
    @quotations = Quotation.all
  end

  def show
    @quotation = Quotation.find(params[:id])
    @car_form = @quotation.car_form
  end

  def new
    @car_form = CarForm.find(params[:car_form_id])
    @quotation = @car_form.quotations.build
  end

  def create
    @car_form = CarForm.find(params[:car_form_id])
    @quotation = Quotation.new(quotation_params)

    if @quotation.save
      redirect_to @quotation, notice: 'Quotation was successfully created.'
    else
      redirect_to admin_index_path
    end
  end

  def edit
  end

  def update
    if @quotation.update(quotation_params)
      redirect_to @quotation, notice: 'Quotation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @quotation.destroy
    redirect_to quotations_url, notice: 'Quotation was successfully destroyed.'
  end

  private

  # def set_quotation
  #   @quotation = Quotation.find(params[:id])
  # end

  def quotation_params
    params.require(:quotation).permit(
      :authenticity_token, :discount, :car_form_id,
      quotation_items_attributes: [:item_name, :item_description, :quantity, :unit_price, :total_price, :_destroy]
    )
  end
end
