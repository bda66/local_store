class Store < ActiveRecord::Base
  geocoded_by :full_address

  has_many :stores_products, dependent: :destroy
  has_many :products, through: :stores_products

  after_validation :geocode

  def full_address
    "#{country}, #{city}, #{postal_code}, #{address}"
  end
end
