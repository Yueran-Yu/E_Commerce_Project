class Address < ApplicationRecord
  belongs_to :province
  belongs_to :devise_user
  validates :street_number, :apartment_number, :city, :postcode, :devise_user_id, presence: true
end
