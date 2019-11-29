class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :id_user
      t.integer :id_product
      t.text :text

      t.timestamps
    end
  end
end
