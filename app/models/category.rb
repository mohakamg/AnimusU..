class Category < ApplicationRecord

  mount_uploader :category_upload, CategoryImageUploader

  has_many :variants
  has_many :products
  has_many :colors

end
