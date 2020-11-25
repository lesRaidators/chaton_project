class Order < ApplicationRecord
    has_many :items
    belongs_to :user

    has_many :order_forms
    has_many :items, through: :order_forms
end
