class Store < ActiveRecord::Base
  has_many :stores_products, dependent: :destroy
  has_many :products, through: :stores_products
end
