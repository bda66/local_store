class Store < ActiveRecord::Base
  has_many :stores_goods, dependent: :destroy
  has_many :goods, through: :stores_goods
end
