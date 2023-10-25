class CreateCarForms < ActiveRecord::Migration[7.0]
  def change
    create_table :car_forms do |t|
      t.string :city
      t.string :address
      t.string :phone_number
      t.string :email
      t.integer :vehicle_type
      t.string :vehicle_identification_number
      t.text :describe

      t.timestamps
    end
  end
end
