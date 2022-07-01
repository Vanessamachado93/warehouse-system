class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :sku, :widht, :heigth,  :depth, :weight, presence: true
end
