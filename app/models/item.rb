class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_url, presence: true
  
  has_many :lineitems
  has_many :order_forms
  has_many :order, through: :order_forms
  

end

