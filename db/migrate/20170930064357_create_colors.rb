class CreateColors < ActiveRecord::Migration[5.1]
  def change
    create_table :colors do |t|
      t.references :category, foreign_key: true
      t.string :color

      t.timestamps
    end
  end
end
