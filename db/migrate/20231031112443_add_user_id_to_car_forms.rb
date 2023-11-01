class AddUserIdToCarForms < ActiveRecord::Migration[7.0]
  def change
    add_reference :car_forms, :user, null: false, foreign_key: true
  end
end
