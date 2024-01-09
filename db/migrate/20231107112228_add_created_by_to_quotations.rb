class AddCreatedByToQuotations < ActiveRecord::Migration[7.0]
  def change
    add_column :quotations, :created_by, :integer
  end
end
