class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name, null: false
      t.float :price, null: false
      t.float :sale_price
      t.string :tags, array: true
      t.boolean :rentable, default: true
      t.string :description, null: false
      t.float :rentable_per_month_price
      t.float :exchange_price
      t.float :rentable_down_deposit
      t.string :product_reference_url
      t.boolean :visible, default: true
      t.string :handle
      t.string :vendor, default: "Animus You"
      t.string :material
      t.string :variant_SKU
      t.float :avg_weight_gms
      t.string :service_provider
      t.string :service_type
      t.string :brand
      t.string :image_url, array: true
      t.string :variants, array: true
      t.string :color, array: true

      t.timestamps
    end
  end
end
