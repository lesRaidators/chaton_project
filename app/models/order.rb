class Order < ApplicationRecord
    has_many :items
    belongs_to :user


    has_many :order_forms
    has_many :items, through: :order_forms


    after_create :order_save


    def order_save
        puts " ==== INFORMATION MAIL METHOD STARTING === "
        OrderMailer.with(order: @order).new_order_email.deliver_now
    end

end
