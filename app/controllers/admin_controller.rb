# app/controllers/admin_controller.rb

class AdminController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @car_forms = CarForm.all
  end

  def attach_file
    @car_form = CarForm.find(params[:id])
    @car_form.attachment.attach(params[:car_form][:car_form][:attachment]) if params[:car_form][:car_form][:attachment].present?
    #@car_form.save
    
    redirect_to admin_index_path
  end

  def delete_attachment
    @car_form = CarForm.find(params[:id])
    @car_form.attachment.purge
    redirect_to admin_index_path
  end

  private

  # def authenticate_admin!
  #   # Implement authentication logic to ensure only admins can access the admin panel
  #   # Example: Add a column 'admin' to your User model and check if current_user.admin is true
  # end
end
