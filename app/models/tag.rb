class Tag < ApplicationRecord
  has_many :ailes
  has_many :products, through: :ailes
end
