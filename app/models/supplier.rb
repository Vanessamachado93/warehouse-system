class Supplier < ApplicationRecord
  validates :brand_name, :corporate_name, :registration_number, :email, :telephone, :state, :city, presence:true
  validates :registration_number, uniqueness:true
end
