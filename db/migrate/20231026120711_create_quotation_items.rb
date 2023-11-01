class CreateQuotationItems < ActiveRecord::Migration[7.0]
  def change
    create_table :quotation_items do |t|
      t.belongs_to :quotation, null: false, foreign_key: true
      t.string :item_name
      t.text :item_description
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :total_price

      t.timestamps
    end
  end
end
