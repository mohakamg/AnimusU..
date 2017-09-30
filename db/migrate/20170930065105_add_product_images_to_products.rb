class AddProductImagesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :product_images, :string, array: true
  end
end
