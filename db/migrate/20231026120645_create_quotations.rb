class CreateQuotations < ActiveRecord::Migration[7.0]
  def change
    create_table :quotations do |t|
      t.decimal :discount

      t.timestamps
    end
  end
end
