class Product < ApplicationRecord
  mount_uploaders :product_images, ProductImageUploader
  belongs_to :category
  has_many :reviews
  has_many :ailes
  has_many :shacks
  has_many :variants, through: :ailes
  has_many :tags, through: :shacks
end
