class QuotationsController < ApplicationController
  #before_action :set_quotation, only: [:show, :edit, :update, :destroy]

  def index
    @quotations = Quotation.all
  end

  def show
  end

  def new
    @car_form = CarForm.find(params[:car_form_id])
    @quotation = Quotation.new
  end

  def create
    @quotation = Quotation.new(quotation_params)
    # debugger

    if @quotation.save
      redirect_to @quotation, notice: 'Quotation was successfully created.'
    else
      render :new
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
    params.require(:quotation).permit(:discount)
  end
end
