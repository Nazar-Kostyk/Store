class CreateOrdersHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_histories do |t|
      t.integer :user_id
      t.string :order_key
      t.integer :products_ids

      t.timestamps
    end
  end
end
