class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_image
      t.float :product_price
      t.text :product_description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
