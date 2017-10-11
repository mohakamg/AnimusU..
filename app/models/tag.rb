class Tag < ApplicationRecord
  has_many :ailes
  has_many :shacks
  has_many :products, through: :shacks
end
