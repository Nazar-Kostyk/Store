class AddColumnSavedPriceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :saved_price, :float
  end
end
