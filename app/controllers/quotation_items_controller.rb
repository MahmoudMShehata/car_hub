# app/controllers/quotation_items_controller.rb

class QuotationItemsController < ApplicationController
  #before_action :set_quotation_item, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @quotation = Quotation.find(params[:quotation_id])
    @quotation_item = @quotation.quotation_items.build
  end

  def create
    @quotation = Quotation.find(params[:quotation_id])
    @quotation_item = @quotation.quotation_items.build(quotation_item_params)

    if @quotation_item.save
      redirect_to @quotation, notice: 'Quotation item was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @quotation_item.update(quotation_item_params)
      redirect_to @quotation_item.quotation, notice: 'Quotation item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @quotation_item.destroy
    redirect_to @quotation_item.quotation, notice: 'Quotation item was successfully destroyed.'
  end

  private

  # def set_quotation_item
  #   @quotation_item = QuotationItem.find(params[:id])
  # end

  def quotation_item_params
    params.require(:quotation_item).permit(:item_name, :item_description, :quantity, :unit_price, :total_price)
  end
end
