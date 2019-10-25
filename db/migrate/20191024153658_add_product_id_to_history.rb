class AddProductIdToHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :orders_histories, :product_id, :integer
  end
end
