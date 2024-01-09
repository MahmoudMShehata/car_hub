class AddApprovedByCustomerToQuotations < ActiveRecord::Migration[7.0]
  def change
    add_column :quotations, :approved_by_customer, :boolean
  end
end
