class Variant < ApplicationRecord
  belongs_to :category
  has_many :ailes
  has_many :products, through: :ailes
end
