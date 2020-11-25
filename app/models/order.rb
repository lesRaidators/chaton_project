class Order < ApplicationRecord
    has_many :items
    belongs_to :user


    after_create :order_save


    def order_save
        puts " ==== INFORMATION MAIL METHOD STARTING === "
        OrderMailer.with(order: @order).new_order_email.deliver_now
    end
end
