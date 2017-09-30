class AddImageToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :category_upload, :string
  end
end
