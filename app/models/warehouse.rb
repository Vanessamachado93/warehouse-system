class Warehouse < ApplicationRecord
  validates :name,:code,:area,:city, :description, :address, :cep, presence: true
  validates :code, uniqueness: true
end
