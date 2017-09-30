class Product < ApplicationRecord
  mount_uploaders :product_images, ProductImageUploader
  belongs_to :category
  has_many :reviews
end
