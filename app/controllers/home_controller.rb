class HomeController < ApplicationController
  def index
    @total_car_forms = current_user.car_forms.count
    @car_forms_with_quotations = current_user.car_forms.joins(:quotations).distinct.count
    @car_forms_without_quotations = current_user.car_forms.left_joins(:quotations).where(quotations: { id: nil }).count
  end
end