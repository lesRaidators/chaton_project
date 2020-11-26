require 'pry'
class OrderMailer < ApplicationMailer
  default from: 'kingcat@yopmail.com'

  def new_order_email (order)

    @order = order


    mail(to: 'kingcat@yopmail.com', subject: "You got a new order!")

  end 
end