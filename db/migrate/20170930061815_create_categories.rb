class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :product_type
      t.string :category_image_url

      t.timestamps
    end
  end
end
