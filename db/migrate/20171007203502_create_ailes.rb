class CreateAiles < ActiveRecord::Migration[5.1]
  def change
    create_table :ailes do |t|
      t.references :product, foreign_key: true
      t.references :variant, foreign_key: true
      #t.references :tag, foreign_key: true
      t.timestamps
    end
  end

  # remove_column :products, :variants
  # remove_column :products, :tags
end
