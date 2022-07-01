class ProductModel < ApplicationRecord
  belongs_to :supplier
  validates :name, :sku, :widht, :heigth,  :depth, :weight, presence: true
  validates :weight , :widht , :heigth , :depth , numericality: { greater_than_or_equal_to: 1 }
  validates :sku, length: { is: 20 }
  validates :sku , uniqueness: true
end
