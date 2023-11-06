class AddCarFormToQuotations < ActiveRecord::Migration[7.0]
  def change
    add_reference :quotations, :car_form, null: false, foreign_key: true
  end
end
