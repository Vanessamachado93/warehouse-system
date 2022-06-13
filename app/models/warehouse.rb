class Warehouse < ApplicationRecord
  validates :name,:code,:area,:city, :description, :address, presence: true
end
