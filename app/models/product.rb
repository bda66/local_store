class Product < ActiveRecord::Base
  belongs_to :category
  has_many :stores_products, dependent: :destroy
  has_many :stores, through: :stores_products
end
